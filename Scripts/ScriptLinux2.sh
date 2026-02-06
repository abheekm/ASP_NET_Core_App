echo "--- CPU Info ---"
grep -m 1 "model name" /proc/cpuinfo

echo "--- Memory Info ---"
free -h || grep MemTotal /proc/meminfo