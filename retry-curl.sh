MAX_RETRIES=3
# Function to retry a curl command
retry_curl() {
    local retries=0
    local base_retry_delay=3
    local response=""
    while [[ $retries -lt $MAX_RETRIES ]]; do
        response=$(curl -s -w "%{http_code}" "$@")
        status_code=${response: -3}  # Extract the status code from the response
        # Check if the status code is one of the ones you want to retry on
        if [[ $status_code != 503 && $status_code != 502 && $status_code != 504 ]]; then
            # If status code is not one of 503, 502, 504, then break and don't retry
            echo "$response"
            return
        fi
        
        ((retries++))
        echo "Attempt #$(($retries)) returned status code: $status_code" >&2
        if [[ $retries -lt $MAX_RETRIES ]]; then
          retry_delay=$(($base_retry_delay**$retries))
          echo "Sleeping for $retry_delay seconds" >&2
          sleep $retry_delay
        fi
    done
    echo "$response"  # If the loop finishes, return the last response
}
