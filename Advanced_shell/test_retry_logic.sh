#!/bin/bash

# Test script to demonstrate retry logic with invalid Pokémon
# This will test the enhanced error handling and retry mechanism

# Source the main script functions (simplified)
API_BASE_URL="https://pokeapi.co/api/v2/pokemon"
MAX_RETRIES=3
RETRY_DELAY=2  # Short delay for testing
ERROR_FILE="test_errors.txt"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_info() { echo -e "${BLUE}$1${NC}"; }
print_warning() { echo -e "${YELLOW}$1${NC}"; }
print_success() { echo -e "${GREEN}$1${NC}"; }

log_error() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR: $1" >> "$ERROR_FILE"
    echo -e "${RED}ERROR: $1${NC}" >&2
}

# Simplified test function to demonstrate retry logic
test_fetch_pokemon() {
    local pokemon_name="$1"
    local api_url="${API_BASE_URL}/${pokemon_name}"
    local temp_file="/tmp/test_${pokemon_name}.json"
    local attempt=1
    
    print_info "Testing fetch for: $pokemon_name"
    
    while [ $attempt -le $MAX_RETRIES ]; do
        print_info "  Attempt $attempt/$MAX_RETRIES"
        
        if curl -s --fail --connect-timeout 10 --max-time 20 "$api_url" -o "$temp_file" 2>/dev/null; then
            if jq empty "$temp_file" 2>/dev/null; then
                print_success "  ✅ Success on attempt $attempt"
                rm -f "$temp_file"
                return 0
            else
                log_error "Invalid JSON received for $pokemon_name (attempt $attempt)"
                rm -f "$temp_file"
            fi
        else
            local curl_exit_code=$?
            case $curl_exit_code in
                22)
                    log_error "HTTP 404: Pokémon '$pokemon_name' not found (attempt $attempt)"
                    print_warning "  ❌ Pokémon not found (non-retryable error)"
                    rm -f "$temp_file"
                    return 1
                    ;;
                *)
                    log_error "Network error for $pokemon_name: exit code $curl_exit_code (attempt $attempt)"
                    ;;
            esac
            rm -f "$temp_file"
        fi
        
        if [ $attempt -lt $MAX_RETRIES ]; then
            print_info "  Waiting ${RETRY_DELAY}s before retry..."
            sleep $RETRY_DELAY
        fi
        
        ((attempt++))
    done
    
    print_warning "❌ Failed after $MAX_RETRIES attempts"
    return 1
}

# Clear error file
> "$ERROR_FILE"

echo "Testing Enhanced Error Handling and Retry Logic"
echo "=============================================="

# Test with valid Pokémon (should succeed on first try)
test_fetch_pokemon "pikachu"
echo ""

# Test with invalid Pokémon (should fail immediately without retry)
test_fetch_pokemon "invalidpokemon123"
echo ""

# Test with another valid Pokémon
test_fetch_pokemon "squirtle"
echo ""

echo "Test Results:"
echo "============"
if [ -s "$ERROR_FILE" ]; then
    echo "Errors logged:"
    cat "$ERROR_FILE"
else
    echo "No errors logged"
fi

# Cleanup
rm -f "$ERROR_FILE"
