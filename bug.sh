#!/bin/bash

# This script demonstrates a race condition bug.

# Create a file to store a counter
touch counter.txt

# Function to increment the counter
increment_counter() {
  local current_count=$(cat counter.txt)
  local new_count=$((current_count + 1))
  echo $new_count > counter.txt
}

# Run the increment_counter function in parallel
for i in {1..10}; do
  increment_counter & 
done

# Wait for all background processes to finish
wait

# Print the final counter value
echo "Final count: $(cat counter.txt)"
