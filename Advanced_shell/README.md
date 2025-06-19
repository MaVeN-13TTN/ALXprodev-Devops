# Advanced Shell Scripting - API Request Automation

## Overview

This project demonstrates advanced shell scripting techniques for automating API requests, specifically designed to fetch Pokémon data from the [PokéAPI](https://pokeapi.co/) and handle various error scenarios gracefully.

## What's Implemented

### 🚀 **API Request Automation Script** (`apiAutomation-0x00`)

A robust shell script that demonstrates the following advanced concepts:

#### **Core Features:**

- **Automated API Requests**: Fetches Pokémon data from the PokéAPI
- **Error Handling**: Comprehensive error catching and logging
- **Data Validation**: JSON format verification
- **Logging System**: Timestamped success and error logs
- **Timeout Management**: Connection and request timeouts
- **Graceful Failures**: Specific error messages for different failure scenarios

#### **Advanced Shell Scripting Techniques Used:**

1. **Error Handling & Process Management**

   - `set -e`: Exit on any command failure
   - `trap` command: Catches errors and logs them with line numbers
   - Exit status checking with `$?`
   - Signal handling for graceful shutdowns

2. **Advanced Commands & Text Processing**

   - `curl` with multiple flags for robust HTTP requests
   - `jq` for JSON parsing and validation
   - `grep` patterns for command availability checking
   - Stream redirection for error logging

3. **Automation & Process Control**

   - Function-based modular design
   - Background process capability
   - Timeout controls for network requests
   - Automatic cleanup on success/failure

4. **Variable Management & Control Structures**
   - Environment variable configuration
   - Conditional logic with `if-else` statements
   - `case` statements for error code handling
   - Function parameters and return values

## Files Structure

```
Advanced_shell/
├── apiAutomation-0x00    # Main automation script
├── README.md            # This documentation
├── data.json           # Generated: Pokémon data (after successful run)
└── errors.txt          # Generated: Error logs (if any errors occur)
```

## Prerequisites

### Required Commands:

- `bash` (version 4.0 or higher)
- `curl` (for API requests)
- `jq` (for JSON processing) - _optional but recommended_

### Installation on Ubuntu/Debian:

```bash
sudo apt update
sudo apt install curl jq
```

### Installation on CentOS/RHEL:

```bash
sudo yum install curl jq
# or for newer versions:
sudo dnf install curl jq
```

### Installation on macOS:

```bash
brew install curl jq
```

## How to Run

### 1. **Make the Script Executable**

```bash
chmod +x apiAutomation-0x00
```

### 2. **Run the Script**

```bash
./apiAutomation-0x00
```

### 3. **Alternative Execution Methods**

```bash
# Direct bash execution
bash apiAutomation-0x00

# With explicit interpreter
/bin/bash apiAutomation-0x00
```

## Expected Output

### **Successful Execution:**

```bash
[2025-06-19 10:30:15] === API Request Automation Started ===
[2025-06-19 10:30:15] Starting API request for Pokémon: pikachu
[2025-06-19 10:30:15] Making request to: https://pokeapi.co/api/v2/pokemon/pikachu
[2025-06-19 10:30:16] Successfully retrieved data for pikachu
[2025-06-19 10:30:16] Data saved to: data.json
[2025-06-19 10:30:16] JSON data validation successful
=== Pokémon Data Retrieved ===
Name: pikachu
ID: 25
Height: 4
Weight: 60
Base Experience: 112
Data file: data.json
==============================
[2025-06-19 10:30:16] Script completed successfully
[2025-06-19 10:30:16] === API Request Automation Completed ===
```

### **Generated Files:**

- `data.json`: Contains the complete Pokémon data in JSON format
- `errors.txt`: Empty file (or contains error logs if issues occurred)

## Viewing the Results

### **View JSON Data (formatted):**

```bash
jq . < data.json | head -n 50
```

### **Extract Specific Information:**

```bash
# Get Pokémon name
jq -r '.name' data.json

# Get abilities
jq -r '.abilities[].ability.name' data.json

# Get base stats
jq -r '.stats[] | "\(.stat.name): \(.base_stat)"' data.json
```

### **Check for Errors:**

```bash
cat errors.txt
```

## Error Scenarios Handled

The script handles various error conditions:

| Error Code | Description            | Action Taken                          |
| ---------- | ---------------------- | ------------------------------------- |
| 6          | DNS resolution failure | Log network connectivity issue        |
| 7          | Connection failure     | Log server connectivity issue         |
| 22         | HTTP error (404, etc.) | Log invalid Pokémon name or API issue |
| 28         | Request timeout        | Log timeout and suggest retry         |
| Others     | Generic failures       | Log with specific exit code           |

## Customization

### **Change Pokémon:**

Edit the `POKEMON_NAME` variable in the script:

```bash
POKEMON_NAME="charizard"  # Change from "pikachu" to any Pokémon name
```

### **Modify Timeouts:**

Adjust the curl timeout values:

```bash
# Connection timeout: 30 seconds
# Max request time: 60 seconds
curl -s --fail --connect-timeout 30 --max-time 60 "$API_URL" -o "$DATA_FILE"
```

### **Change Output Files:**

Modify the file variables:

```bash
DATA_FILE="pokemon_data.json"
ERROR_FILE="api_errors.log"
```

## Troubleshooting

### **Common Issues:**

1. **"curl command not found"**

   ```bash
   sudo apt install curl  # Ubuntu/Debian
   sudo yum install curl  # CentOS/RHEL
   ```

2. **"Permission denied"**

   ```bash
   chmod +x apiAutomation-0x00
   ```

3. **"No internet connection"**

   - Check network connectivity
   - Verify DNS resolution: `nslookup pokeapi.co`

4. **"jq command not found"**
   ```bash
   sudo apt install jq  # Ubuntu/Debian
   # Script will still work without jq, but with limited JSON validation
   ```

## Advanced Usage

### **Running with Different Pokémon:**

```bash
# Temporarily override the Pokémon name
POKEMON_NAME="bulbasaur" ./apiAutomation-0x00
```

### **Background Execution:**

```bash
nohup ./apiAutomation-0x00 > output.log 2>&1 &
```

### **Scheduled Execution:**

Add to crontab for automated runs:

```bash
# Run every day at 9 AM
0 9 * * * /path/to/apiAutomation-0x00
```

## Learning Outcomes

This script demonstrates:

- ✅ **Process Management**: Background processes, job control, signal handling
- ✅ **Error Handling**: Trap commands, exit status checking, comprehensive logging
- ✅ **Automation**: API integration, data processing, file management
- ✅ **Advanced Commands**: curl, jq, conditional execution, text processing
- ✅ **Best Practices**: Modular functions, proper variable scoping, documentation

## API Reference

**PokéAPI Endpoint Used:**

- **URL**: `https://pokeapi.co/api/v2/pokemon/{pokemon_name}`
- **Method**: GET
- **Response**: JSON with comprehensive Pokémon data
- **Documentation**: [https://pokeapi.co/docs/v2](https://pokeapi.co/docs/v2)

## Contributing

Feel free to enhance the script by:

- Adding support for multiple Pokémon
- Implementing data caching
- Adding more error recovery mechanisms
- Creating additional output formats

---

**Author**: Advanced Shell Scripting Project  
**Date**: June 19, 2025  
**Version**: 1.0
