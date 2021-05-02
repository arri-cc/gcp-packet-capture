# GCP Packet Mirroring and Capture Solution

This is a simple solution that leverages Google Cloud Packet Mirroring [1] to make troubleshooting easier.  This was in response to a need to capture packets for a workload running in GKE with pods across several nodes.  What's provisioned:

- A packet mirroring policy to mirror packets from GCE instances using the provided network tags
- An internal TCP Load Balancer, health check, backend service, instance group, and GCE instance to capture the mirrored traffic
- Firewall rules to permit the required traffic

## Prequisites

- Terraform v0.15.1 [2] _For easy switching between terraform versions, use `tfenv` [3]_
- Google Cloud SDK (gcloud CLI) [4]

## Getting Started

1. Setup google credentials `gcloud auth application-default login`
2. If required, switch to terraform v0.15.1 `tfenv install 0.15.1 && tfenv use 0.15.1`
3. Initialize terraform, using default local state `terraform init`
4. Make a copy of the variables input file `cp terraform.tfvars.sample terraform.tfvars`
5. Edit `terraform.tfvars` to reflect values for your environment, also overriding any default values you would like to change that are located in the `vars.tf` file.
6. Run the plan `terraform plan -out tf.plan`
7. If everything looks good, apply `terraform apply tf.plan`
8. connect to the vm to run `tcpdump` via `gcloud compute ssh pcap-vm --tunnel-through-iap`.  Here's a great guide to filtering traffic via `tcpdump` options [5].

## Todo

- [ ] Run tcpdump as a daemon
- [ ] Write pcap file to GCS
- [x] SSH via IAP configuration

References:

- [1] Google Cloud Packet Mirroring: <https://cloud.google.com/vpc/docs/packet-mirroring>
- [2] Terraform: <https://www.terraform.io/downloads.html>
- [3] tfenv: <https://github.com/tfutils/tfenv>
- [4] Google Cloud SDK: <https://cloud.google.com/sdk/docs/install>
- [5] tcpdump: <https://danielmiessler.com/study/tcpdump/>
