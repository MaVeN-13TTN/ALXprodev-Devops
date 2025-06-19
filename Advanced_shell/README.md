# Advanced Shell Scripting

## Overview

This project demonstrates advanced shell scripting techniques for automating API requests, specifically designed to fetch Pokémon data from the [PokéAPI](https://pokeapi.co/) and handle various error scenarios gracefully.

## What's Implemented

### 🚀 **API Request Automation Script** (`apiAutomation-0x00`)

A robust shell script that demonstrates the following advanced concepts:

### 📊 **Data Extraction Scripts** (`data_extraction_automation-0x01` & `parse_pikachu`)

Advanced text manipulation scripts that extract and format Pokémon data using `jq`, `awk`, and `sed`:

### 📊 **Data Summary Scripts** (`summaryData-0x03` & `pokemon_report`)

Advanced data analysis scripts that generate CSV reports and statistical summaries using `awk`, `sed`, and `jq`:

#### **Data Summary Features:**

- **CSV Report Generation**: Creates formatted CSV files with Pokémon data
- **Statistical Analysis**: Calculates averages, ranges, and data distributions
- **Multi-format Output**: Console display, CSV files, and detailed reports
- **Error Handling**: Validates data integrity and handles missing files
- **Customizable Processing**: Configurable data directories and output files
- **Advanced AWK Usage**: Complex mathematical calculations and data processing

#### **Statistical Processing Techniques:**

1. **AWK Data Analysis**

   - Field separation and CSV processing
   - Mathematical calculations (averages, min/max, ranges)
   - Conditional data processing and filtering
   - Multi-pass data analysis for complex statistics

2. **Data Transformation**

   - Unit conversions using mathematical operations
   - Text formatting and capitalization with `sed`
   - JSON parsing and field extraction with `jq`
   - Data validation and error detection

3. **Report Generation**

   - Formatted console output with colors
   - CSV file creation and management
   - Comprehensive text reports with statistics
   - Error logging and processing summaries

### 🔄 **Batch Processing Scripts** (`batchProcessing-0x02` & `fetch_multiple_pokemon`)

Automated batch retrieval scripts that fetch data for multiple Pokémon with rate limiting and error handling:

#### **Batch Processing Features:**

- **Multiple Pokémon Retrieval**: Fetches data for a predefined list of Pokémon
- **Enhanced Retry Logic**: Automatic retry mechanism with up to 3 attempts per request
- **Smart Error Detection**: Distinguishes between retryable and non-retryable errors
- **Rate Limiting**: Configurable delays between API requests to respect server limits
- **Network Connectivity Checks**: Validates network availability before retrying
- **Directory Management**: Automatically creates organized data directories
- **Progress Tracking**: Real-time progress indicators during batch operations
- **Comprehensive Error Handling**: Detailed error logging and recovery mechanisms
- **File Validation**: JSON validation and completeness checks
- **Statistics Display**: File size, Pokémon stats, and processing summaries
- **Skip Existing Files**: Intelligently skips already-downloaded valid files

#### **Enhanced Error Handling & Retry Logic:**

1. **Retry Mechanism**

   - **Maximum Retries**: Configurable (default: 3 attempts)
   - **Retry Delays**: Configurable delays between retry attempts (default: 5 seconds)
   - **Smart Retry Logic**: Different handling for different error types
   - **Non-retryable Errors**: HTTP 404 (Pokémon not found) - fails immediately
   - **Retryable Errors**: Network timeouts, connection failures, server errors

2. **Error Classification**

   - **Network Errors**: DNS resolution failures, connection timeouts
   - **API Errors**: HTTP error codes, invalid responses
   - **Data Errors**: Invalid JSON, missing required fields
   - **File System Errors**: Permission issues, disk space problems

3. **Robust Validation**

   - **Pokémon Name Validation**: Checks for valid character formats
   - **JSON Structure Validation**: Ensures required fields are present
   - **Data Integrity Checks**: Verifies returned data matches requested Pokémon
   - **File Completeness**: Validates file size and content structure

4. **Advanced Configuration Options**
   ```bash
   --max-retries NUM      # Set maximum retry attempts (1-10)
   --retry-delay SEC      # Set delay between retries (seconds)
   --delay SEC           # Set delay between normal requests (seconds)
   ```

#### **Process Management Techniques:**

1. **Background Processing**: Optional background execution for large batches
2. **Signal Handling**: Graceful shutdown and cleanup on interruption
3. **Resource Management**: Memory-efficient processing of large datasets
4. **Concurrent Processing**: Parallel request handling (where appropriate)

#### **Data Extraction Features:**

- **Advanced Text Processing**: Uses `jq`, `awk`, and `sed` for sophisticated text manipulation
- **JSON Parsing**: Extracts specific fields from complex JSON structures
- **Data Transformation**: Converts units (hectograms to kg, decimeters to meters)
- **String Formatting**: Capitalizes names and formats output strings
- **Error Handling**: Validates data availability and command dependencies
- **Multiple Output Modes**: Simple and verbose extraction modes

#### **Text Processing Techniques Demonstrated:**

1. **jq JSON Processing**

   - Extracting nested JSON values
   - Array processing for types
   - Raw output formatting

2. **awk Text Manipulation**

   - Mathematical calculations for unit conversion
   - String formatting with printf
   - Multi-line processing and concatenation
   - Conditional output formatting

3. **sed Stream Editing**
   - Case conversion (uppercase/lowercase)
   - Whitespace normalization
   - Pattern-based text cleaning

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
├── apiAutomation-0x00                 # Main API automation script
├── data_extraction_automation-0x01    # Comprehensive data extraction script
├── parse_pikachu                      # Simple Pokémon data parser
├── summaryData-0x03                   # Comprehensive data summary script
├── pokemon_report                     # Simple Pokémon data report script
├── batchProcessing-0x02              # Comprehensive batch processing script
├── fetch_multiple_pokemon             # Simple batch fetching script
├── README.md                          # This documentation
├── data.json                          # Generated: Single Pokémon data (Pikachu)
├── pokemon_data/                      # Generated: Directory for batch data
│   ├── bulbasaur.json                # Individual Pokémon data files
│   ├── ivysaur.json
│   ├── venusaur.json
│   ├── charmander.json
│   └── charmeleon.json
├── pokemon_report.csv                 # Generated: CSV report with Pokémon data
├── pokemon_summary_report.txt         # Generated: Detailed summary report
├── errors.txt                         # Generated: API error logs
├── extraction_errors.txt              # Generated: Extraction error logs
├── batch_errors.txt                   # Generated: Batch processing error logs
├── summary_errors.txt                 # Generated: Summary processing error logs
└── batch_processing.log               # Generated: Batch processing activity log
```

├── extraction_errors.txt # Generated: Extraction error logs
├── batch_errors.txt # Generated: Batch processing error logs
└── batch_processing.log # Generated: Batch processing activity log

````

## Prerequisites

### Required Commands:

- `bash` (version 4.0 or higher)
- `curl` (for API requests)
- `jq` (for JSON processing) - _optional but recommended_

### Installation on Ubuntu/Debian:

```bash
sudo apt update
sudo apt install curl jq
````

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

### **Step 1: API Data Retrieval**

#### **Make the API script executable:**

```bash
chmod +x apiAutomation-0x00
```

#### **Run the API automation script:**

```bash
./apiAutomation-0x00
```

#### **Alternative execution methods:**

```bash
# Direct bash execution
bash apiAutomation-0x00

# With explicit interpreter
/bin/bash apiAutomation-0x00
```

### **Step 2: Data Extraction**

#### **Make the extraction scripts executable:**

```bash
chmod +x data_extraction_automation-0x01
chmod +x parse_pikachu
```

#### **Run the simple parser (matches sample output):**

```bash
./parse_pikachu
# Output: Pikachu is of type Electric, weighs 6kg, and is 0.4m tall.
```

#### **Run the comprehensive extraction script:**

```bash
# Simple output
./data_extraction_automation-0x01

# Verbose output with detailed breakdown
./data_extraction_automation-0x01 --verbose

# Custom data file
./data_extraction_automation-0x01 --file custom_pokemon.json
```

### **Step 3: Data Summary**

#### **Make the summary scripts executable:**

```bash
chmod +x summaryData-0x03
chmod +x pokemon_report
```

#### **Run the simple report generator (matches sample output):**

```bash
./pokemon_report
# Generates CSV report and calculates averages
```

#### **Run the comprehensive summary script:**

```bash
# Basic summary with CSV generation
./summaryData-0x03

# Detailed statistics with ranges and totals
./summaryData-0x03 --stats

# Generate comprehensive report file
./summaryData-0x03 --report

# Custom data directory
./summaryData-0x03 --data-dir my_pokemon_data

# Custom output file
./summaryData-0x03 --output my_report.csv
```

### **Step 4: Batch Processing**

#### **Make the batch processing scripts executable:**

```bash
chmod +x batchProcessing-0x02
chmod +x fetch_multiple_pokemon
```

#### **Run the simple batch fetcher (matches sample output):**

```bash
./fetch_multiple_pokemon
# Fetches bulbasaur, ivysaur, venusaur, charmander, charmeleon
```

#### **Run the comprehensive batch processor with enhanced error handling:**

```bash
# Full processing with validation and statistics
./batchProcessing-0x02

# Custom retry configuration
./batchProcessing-0x02 --max-retries 5 --retry-delay 10

# Custom delay between requests
./batchProcessing-0x02 --delay 5

# Combined custom settings
./batchProcessing-0x02 --max-retries 3 --retry-delay 5 --delay 3

# Custom output directory
./batchProcessing-0x02 --output my_pokemon_data

# Validate existing files only
./batchProcessing-0x02 --validate

# Show file statistics
./batchProcessing-0x02 --stats

# Clean up failed downloads
./batchProcessing-0x02 --cleanup

# View help and all available options
./batchProcessing-0x02 --help
```

## Expected Output

### **API Script Execution:**

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

### **Data Extraction Outputs:**

#### **Simple Parser (`parse_pikachu`):**

```bash
$ ./parse_pikachu
Pikachu is of type Electric, weighs 6kg, and is 0.4m tall.
```

#### **Comprehensive Script (Normal Mode):**

```bash
$ ./data_extraction_automation-0x01
Pikachu is of type Electric, weighs 6kg, and is 0.4m tall.
```

#### **Comprehensive Script (Verbose Mode):**

```bash
$ ./data_extraction_automation-0x01 --verbose
=== Pokémon Data Extraction ===
Data file: data.json

Extracting components...
Name: Pikachu
Type(s): Electric
Weight: 6kg
Height: 0.4m

Formatted output:
Pikachu is of type Electric, weighs 6kg, and is 0.4m tall.

=== Extraction Complete ===
```

### **Data Summary Outputs:**

#### **Simple Pokémon Report (`pokemon_report`):**

```bash
$ ./pokemon_report
Pikachu,Electric,6kg,0.4m
```

#### **Comprehensive Data Summary (`summaryData-0x03`):**

```bash
$ ./summaryData-0x03 --report
Generating CSV report for Pokémon data...
CSV report saved to: pokemon_summary_report.csv
```

```bash
$ ./summaryData-0x03 --stats
Calculating statistics for Pokémon data...
Average Weight: 6kg
Average Height: 0.4m
```

### **Batch Processing Outputs:**

#### **Simple Batch Fetcher (`fetch_multiple_pokemon`):**

```bash
$ ./fetch_multiple_pokemon
Fetching data for bulbasaur...
Saved data to pokemon_data/bulbasaur.json ✅
Fetching data for ivysaur...
Saved data to pokemon_data/ivysaur.json ✅
Fetching data for venusaur...
Saved data to pokemon_data/venusaur.json ✅
Fetching data for charmander...
Saved data to pokemon_data/charmander.json ✅
Fetching data for charmeleon...
Saved data to pokemon_data/charmeleon.json ✅
```

#### **Comprehensive Batch Processor with Enhanced Error Handling:**

```bash
$ ./batchProcessing-0x02 --max-retries 2 --retry-delay 3
Starting batch processing of 5 Pokémon...
Configuration: Max retries=2, Request delay=2s, Retry delay=3s
Network connectivity verified ✅
[1/5] Processing: bulbasaur
  File already exists and is valid, skipping...
  Waiting 2s before next request...
[2/5] Processing: ivysaur
  File already exists and is valid, skipping...
  Waiting 2s before next request...
[3/5] Processing: venusaur
  File already exists and is valid, skipping...
  Waiting 2s before next request...
[4/5] Processing: charmander
Fetching data for charmander...
Saved data to pokemon_data/charmander.json ✅
  Completed in 1s
  Waiting 2s before next request...
[5/5] Processing: charmeleon
  File already exists and is valid, skipping...

=== Batch Processing Summary ===
✅ Successful: 5/5
⏭️  Skipped (existing): 4/5
📊 Success rate for new downloads: 100.0%

Validating downloaded files...
✅ bulbasaur.json - Valid
✅ ivysaur.json - Valid
✅ venusaur.json - Valid
✅ charmander.json - Valid
✅ charmeleon.json - Valid
All files validated successfully!

=== File Statistics ===
bulbasaur       | ID: 1   | Size: 252KiB   | H: 7   | W: 69
ivysaur         | ID: 2   | Size: 222KiB   | H: 10  | W: 130
venusaur        | ID: 3   | Size: 262KiB   | H: 20  | W: 1000
charmander      | ID: 4   | Size: 279KiB   | H: 6   | W: 85
charmeleon      | ID: 5   | Size: 244KiB   | H: 11  | W: 190
```

#### **Error Handling and Retry Logic Example:**

```bash
# Example with retry logic for network errors
$ ./batchProcessing-0x02 --max-retries 3
[4/5] Processing: charmander
Fetching data for charmander...
  Attempt 1/3
ERROR: Request timeout for charmander: exit code 28 (attempt 1)
  Waiting 5s before retry...
  Retry attempt 2/3 for charmander
Saved data to pokemon_data/charmander.json ✅
  Completed in 8s

# Example with non-retryable error (Pokémon not found)
[5/5] Processing: invalidpokemon
Fetching data for invalidpokemon...
  Attempt 1/3
ERROR: HTTP 404: Pokémon 'invalidpokemon' not found (attempt 1)
  ❌ Pokémon not found (non-retryable error)
❌ Failed to fetch invalidpokemon after 1 attempts
```

#### **Advanced Configuration Examples:**

```bash
# Custom retry settings
$ ./batchProcessing-0x02 --max-retries 5 --retry-delay 10 --delay 3

# Output to custom directory
$ ./batchProcessing-0x02 --output my_pokemon_data

# Validation only mode (check existing files)
$ ./batchProcessing-0x02 --validate

# Statistics only mode (show file info without downloading)
$ ./batchProcessing-0x02 --stats
```

#### **Validation of Downloaded Files:**

```bash
$ jq . < pokemon_data/bulbasaur.json | head -n 30
{
  "abilities": [
    {
      "ability": {
        "name": "overgrow",
        "url": "https://pokeapi.co/api/v2/ability/65/"
      },
      "is_hidden": false,
      "slot": 1
    },
    {
      "ability": {
        "name": "chlorophyll",
        "url": "https://pokeapi.co/api/v2/ability/34/"
      },
      "is_hidden": true,
      "slot": 3
    }
  ],
  "base_experience": 64,
  "cries": {
    "latest": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/1.ogg",
    "legacy": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/legacy/1.ogg"
  },
  "forms": [
    {
      "name": "bulbasaur",
      "url": "https://pokeapi.co/api/v2/pokemon-form/1/"
    }
  ],
```

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
