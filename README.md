# Streamlit Dashboard on CBE.next

This repository contains an Open OnDemand Batch Connect app for launching the AF3 screening or small-RNA Streamlit application on the CBE.next Slurm cluster.

## Applications

Choose an application in the **Applications** form field:

| Selection | Project directory | Streamlit entry point |
| --- | --- | --- |
| Alphafold3 Screening | `/groups/burga/bioinfo/tianhua.liao/AF3_auto` | `af3_dashboard.py` |
| Small RNA prediction and mRNA Codon Optimization | `/groups/burga/bioinfo/tianhua.liao/sRNAescape` | `GUI.py` |

The selected directory and entry point are mapped in `template/script.sh.erb`. Add another `case` entry there when adding an application.

## Runtime environment

The startup script loads Conda's shell hook from:

```text
/software/system/miniforge3/miniforge3-26.7.2-0/etc/profile.d/conda.sh
```

It then activates this environment:

```text
/groups/burga/bioinfo/tianhua.liao/conda
```

Both applications must have Streamlit and their required Python packages installed in that environment.

## Open OnDemand session

The form requests a Slurm partition, CPU cores, memory, and wall time. The job starts Streamlit on an available compute-node port and sets Streamlit's base URL path for the Open OnDemand reverse proxy. Once the server is listening, the session page provides an **Open Streamlit** link.

The app is configured for the CBE cluster (`cbe`) and uses the `basic` Batch Connect template. The application code and paths above must be accessible from the compute node.

## Local configuration

- `form.yml` defines the application and resource selections.
- `submit.yml.erb` builds the Slurm job request.
- `template/before.sh.erb` selects the port and sets the proxy base path.
- `template/script.sh.erb` activates Conda and starts the selected application.
- `template/after.sh` waits for Streamlit to become available.
- `view.html.erb` renders the session connection link.
