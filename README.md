# AF3 Streamlit Dashboard on CBE.next

This Open OnDemand Batch Connect app submits a Slurm job to the `cbe` cluster
and starts the AF3 Streamlit dashboard from the existing conda environment.

The app currently uses these paths:

- Conda environment: `/groups/burga/biooptics/scripts/env`
- Project directory: `/groups/burga/bioinfo/tianhua.liao/AF3_auto`
- Streamlit entry point: `af3_dashboard.py`

The OOD job template selects a free port on the compute node, waits for
Streamlit to listen, and opens it through OOD's `/node/<host>/<port>/` reverse
proxy. The form exposes the CBE account, queue, and wall time.
