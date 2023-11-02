MAX_RETRIES=3
# Function to retry a curl command
retry_curl() {
    local retries=0
    local base_retry_delay=3
    local response=""
    while [[ $retries -lt $MAX_RETRIES ]]; do
        response=$(curl -s -w "%{http_code}" "$@")
        curl_exit_code=$?
        echo "curl_exit_code=$curl_exit_code" >&2; sync
        if [ $curl_exit_code = 0 ]; then
            status_code=${response: -3}  # Extract the status code from the response
            if [[ $status_code != 104 && $status_code != 107 && $status_code != 502 && $status_code != 503 && $status_code != 504 ]]; then
                # If status code is not connection reset (104/107) or service unavailable (502/503/504) => break and don't retry
                echo "$response"
                return
            fi
        else
            echo "Curl failed with exit code: $curl_exit_code" >&2
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
