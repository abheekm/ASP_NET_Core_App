#Hello & Environment Check
echo "=== Basic Script Test ==="
echo "Shell: $SHELL"
echo "User: $(whoami)"
echo "Date: $(date)"
echo "Current directory: $(pwd)"
echo "Listing files:"
ls -la

#CPU, Memory & Disk Test
echo "=== System Check ==="

echo "--- CPU Info ---"
grep -m 1 "model name" $CPU_Info

echo "--- Memory Info ---"
free -h || grep MemTotal $Memory_Info

echo "--- Disk Info ---"
df -h .

#Network Test
echo "=== Network Test ==="

echo "Pinging google.com..."
ping -c 3 google.com

echo "Checking DNS..."
nslookup google.com 2>/dev/null || dig google.com

#Parallel Job Simulation
echo "=== Parallel Job Simulation ==="

run_job() {
  echo "Starting job $1"
  sleep $(($1 % 5 + 1))
  echo "Finished job $1"
}

for i in 1 2 3 4 5; do
  run_job "$i" &
done

echo "Waiting for all jobs..."
wait
echo "All parallel jobs completed."

#File I/O + Hash Verification
echo "=== File I/O Test ==="

TESTFILE="testfile.txt"

echo "Generating test file..."
dd if=/dev/urandom of=$TESTFILE bs=1K count=10 >/dev/null 2>&1

echo "Calculating hash..."
hash1=$(sha256sum $TESTFILE | cut -d ' ' -f 1)

echo "Copying file..."
cp $TESTFILE copy.txt

hash2=$(sha256sum copy.txt | cut -d ' ' -f 1)

if [ "$hash1" = "$hash2" ]; then
  echo "Hash matched: File copy successful."
else
  echo "Hash mismatch!!! Copy failed."
  exit 1
fi