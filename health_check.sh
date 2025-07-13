#!/bin/bash

# SysSage - System Health & Log Monitor Script
# Author: Harsh
# Description: Modular system health checker with logging support

# =========  CONFIG LOADER =========
load_config() {
    DISK_LIMIT=90
    MEM_LIMIT=80
    # Future: Load from config file if exists
}

# =========  DISK USAGE CHECK  =========
check_disk_usage() {
    echo "🔍 Checking disk usage..."
    df -h | awk '$5+0 > 90 {print "❗ Disk Alert: "$5" used on "$6}'
}

# =========  MEMORY CHECK =========
check_memory_usage() {
    echo "🔍 Checking memory usage..."
    free -m | awk 'NR==2 {used=$3; total=$2; usage=int(used*100/total); print "Memory used: " usage "% (" used "MB of " total "MB)"}'
}

# =========  CPU LOAD CHECK =========
check_cpu_load() {
    echo "🔍 Checking CPU load average..."
    uptime | awk -F'load average:' '{print "CPU Load Avg:" $2}'
}

# =========  LOG ERROR SCAN =========
scan_logs_for_errors() {
    echo "🔍 Scanning logs for recent errors..."
    grep -iE 'error|fail|critical' /var/log/syslog 2>/dev/null | tail -n 10
}

# =========  TEST EXECUTION =========
run_tests() {
    echo "🔁 Running sanity test scripts..."
    for test_script in tests/*.sh; do
        bash "$test_script"
        if [ $? -eq 0 ]; then
            echo "✅ $test_script PASSED"
        else
            echo "❌ $test_script FAILED"
        fi
    done
}

# =========  GENERATE REPORT =========
generate_report() {
    timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
    log_file="logs/system_report_$timestamp.log"

    {
        echo "======= SysSage Report - $timestamp ======="
        check_disk_usage
        check_memory_usage
        check_cpu_load
        scan_logs_for_errors
    } >> "$log_file"

    echo "📁 Report saved to $log_file"
}

# ========= MAIN =========
main() {
    load_config
    check_disk_usage
    check_memory_usage
    check_cpu_load
    scan_logs_for_errors
    run_tests
    generate_report
    echo "✅ SysSage Check Complete"
}

main
