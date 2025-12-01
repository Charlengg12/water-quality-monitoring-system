# Water Quality Testing & Monitoring System

A comprehensive water quality monitoring system with ESP32 integration, featuring real-time sensor readings, automated testing, and web-based dashboard.

## Features

- **Real-time Monitoring**: Live sensor data displayed on web dashboard
- **ESP32 Integration**: Hardware sensors for TDS, pH, Turbidity, Lead, and Color analysis
- **Automated Testing**: Configurable auto-test schedules (hourly, daily, monthly)
- **Data Logging**: All test results stored in database with timestamp
- **Web Dashboard**: Modern, responsive interface with gauge visualizations

## Project Structure

- `dashboard.php` - Main web dashboard with real-time sensor display
- `new esp32 code` - ESP32 Arduino code for sensor integration
- `esp32 code.txt` - Original ESP32 code reference
- `scrip.js` - JavaScript utilities for ESP32 communication

## ESP32 Configuration

- **IP Address**: 192.168.68.250 (static)
- **Sensor ID**: ISUIT-WQTAMS-0001
- **Server**: Posts to dashboard.php with station_id parameter
- **Endpoints**:
  - `/readings` - GET current sensor readings
  - `/start_test` - POST to trigger test cycle

## Dashboard Features

- Real-time gauge displays for all water quality parameters
- Test history and results viewing
- Auto-test configuration modal
- Station selection and management
- Downloadable test reports

## Database Schema

The system uses a `water_data` table with the following structure:
- station_id, sensor_id
- tds_value, ph_value, turbidity_value, lead_value, color_value
- tds_status, ph_status, turbidity_status, lead_status, color_status, color_result
- timestamp

## Installation

1. Upload ESP32 code to your device
2. Configure WiFi credentials in the ESP32 code
3. Set up PHP server with database connection
4. Access dashboard.php through web browser

## Recent Fixes

- Fixed ESP32 upload endpoint and data format
- Corrected CORS headers for web button interactions
- Aligned data formats between ESP32 and dashboard
- Fixed server URL mismatch (dashboard.php integration)

