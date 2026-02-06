echo "--- CPU Info ---"
grep -m 1 "model name" $CPU_Info

echo "--- Memory Info ---"
free -h || grep MemTotal $Memory_Info