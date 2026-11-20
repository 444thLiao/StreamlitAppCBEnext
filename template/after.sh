# Wait for Streamlit to start so the session only becomes available when its
# web server is listening on the OOD-assigned port.
echo "Waiting for Streamlit to open port ${port}..."
echo "TIMING - Starting wait at: $(date)"
if wait_until_port_used "${host}:${port}" 120; then
  echo "Streamlit is listening on port ${port}."
  echo "TIMING - Wait ended at: $(date)"
else
  echo "Timed out waiting for Streamlit on port ${port}."
  echo "TIMING - Wait ended at: $(date)"
  clean_up 1
fi
sleep 2
