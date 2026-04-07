# VM Health Monitor

A lightweight bash script to monitor virtual machine health by tracking CPU, Memory, and Disk usage metrics.

## Overview

This script provides real-time monitoring of critical VM health metrics and alerts you when any metric exceeds its threshold. It's designed to be simple, portable, and can be shared across any user/system that has bash installed.

## Features

- ✅ Real-time CPU usage monitoring
- ✅ Real-time Memory usage monitoring
- ✅ Real-time Disk usage monitoring
- ✅ Color-coded health status (Green = Healthy, Red = Unhealthy)
- ✅ Detailed metric explanation with EXPLAIN argument
- ✅ Timestamp on each report
- ✅ Easy to integrate into cron jobs for automated monitoring

## Health Thresholds

| Metric | Threshold | Status |
|--------|-----------|--------|
| **CPU Usage** | < 75% | Healthy ✓ |
| **Memory Usage** | < 70% | Healthy ✓ |
| **Disk Usage** | < 90% | Healthy ✓ |

If any metric exceeds its threshold, the VM is considered **UNHEALTHY** and requires attention.

## Requirements

- Bash shell
- Linux/Unix-based system
- Standard utilities: `top`, `free`, `df`, `bc`, `awk`, `sed`, `grep`

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/YashwanthGogikar/vm-health-monitor.git
   cd vm-health-monitor
   ```

2. Make the script executable:
   ```bash
   chmod +x vm-health-monitor.sh
   ```

## Usage

### Basic Usage
Run the script to get a quick health report:
```bash
./vm-health-monitor.sh
```

**Output Example:**
```
================================
   VM HEALTH MONITOR REPORT
================================

CPU Usage: 45.32%
✓ HEALTHY

Memory Usage: 62.15%
✓ HEALTHY

Disk Usage: 78.50%
✓ HEALTHY

================================
Overall Status: ✓ VM IS HEALTHY
================================

Report generated on: 2026-04-07 14:23:45
```

### With EXPLAIN Argument
Get detailed explanations of each metric:
```bash
./vm-health-monitor.sh EXPLAIN
```

**Output Example:**
```
... (same as above) ...

================================
   METRIC EXPLANATION
================================

CPU Usage:
  - Threshold: Less than 75%
  - Healthy CPU usage indicates the system is not overloaded
  - Current status: CPU < 75% means your VM has adequate processing capacity

Memory Usage:
  - Threshold: Less than 70%
  - Healthy memory usage ensures sufficient RAM for applications
  - Current status: Memory < 70% means your VM has enough free memory

Disk Usage:
  - Threshold: Less than 90%
  - Healthy disk usage prevents storage issues and system slowdowns
  - Current status: Disk < 90% means your VM has adequate disk space

Report generated on: 2026-04-07 14:23:45
```

## Metrics Explained

### CPU Usage
- **Metric**: Percentage of CPU currently in use
- **Threshold**: Less than 75%
- **Why it matters**: High CPU usage can indicate system overload, slow performance, or runaway processes
- **Healthy Range**: 0-74% = ✓ HEALTHY

### Memory Usage
- **Metric**: Percentage of RAM currently in use
- **Threshold**: Less than 70%
- **Why it matters**: Insufficient free memory can cause system slowdowns, application crashes, and swap usage
- **Healthy Range**: 0-69% = ✓ HEALTHY

### Disk Usage
- **Metric**: Percentage of root filesystem (/) capacity used
- **Threshold**: Less than 90%
- **Why it matters**: Running out of disk space can prevent log writing, application failures, and system instability
- **Healthy Range**: 0-89% = ✓ HEALTHY

## Advanced Usage

### Schedule Monitoring with Cron
Monitor VM health every 30 minutes:
```bash
*/30 * * * * /path/to/vm-health-monitor.sh >> /var/log/vm-health.log 2>&1
```

Monitor with explanations daily at 9 AM:
```bash
0 9 * * * /path/to/vm-health-monitor.sh EXPLAIN >> /var/log/vm-health-report.log 2>&1
```

### Redirect Output to Log File
```bash
./vm-health-monitor.sh > vm-health-report.txt 2>&1
./vm-health-monitor.sh EXPLAIN > vm-health-detailed-report.txt 2>&1
```

## Color Coding

- 🟢 **Green (✓ HEALTHY)**: Metric is within acceptable threshold
- 🔴 **Red (✗ UNHEALTHY)**: Metric has exceeded threshold and requires attention

## Troubleshooting

### Script won't execute
```bash
chmod +x vm-health-monitor.sh
./vm-health-monitor.sh
```

### Command not found error
Ensure you're in the script directory or use the full path:
```bash
/full/path/to/vm-health-monitor.sh
```

### Permission denied
Run with appropriate privileges:
```bash
sudo ./vm-health-monitor.sh
```

### bc command not found
Install the bc package:
```bash
# Ubuntu/Debian
sudo apt-get install bc

# RHEL/CentOS
sudo yum install bc
```

## Example Scenarios

### Scenario 1: Healthy VM
```
CPU Usage: 35.50% ✓ HEALTHY
Memory Usage: 52.30% ✓ HEALTHY
Disk Usage: 75.20% ✓ HEALTHY
Overall Status: ✓ VM IS HEALTHY
```
**Action**: No action needed. System is running optimally.

### Scenario 2: High Memory Usage
```
CPU Usage: 42.10% ✓ HEALTHY
Memory Usage: 78.50% ✗ UNHEALTHY
Disk Usage: 85.60% ✓ HEALTHY
Overall Status: ✗ VM NEEDS ATTENTION
```
**Action**: Investigate running processes and consider:
- Stopping unnecessary services
- Increasing RAM
- Identifying memory-consuming applications

### Scenario 3: Full Disk
```
CPU Usage: 48.90% ✓ HEALTHY
Memory Usage: 65.40% ✓ HEALTHY
Disk Usage: 95.30% ✗ UNHEALTHY
Overall Status: ✗ VM NEEDS ATTENTION
```
**Action**: Free up disk space immediately:
- Remove old log files
- Clean package cache
- Archive old data

## Contributing

Feel free to fork this repository and submit pull requests for improvements!

## License

This script is provided as-is for monitoring purposes. Use at your own discretion.

## Support

For issues, questions, or suggestions, please open an issue on the GitHub repository.

---

**Last Updated**: 2026-04-07
**Maintainer**: YashwanthGogikar