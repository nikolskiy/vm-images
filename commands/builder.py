from sh import ansible_playbook
import sys
from pathlib import Path

# Project root
ROOT_DIR = Path(__file__).resolve().parent.parent
ANSIBLE_DIR = ROOT_DIR / "ansible"

def playbook(playbook_name: str):
    """Runs an Ansible playbook."""
    print(f"Running playbook {playbook_name}...")
    ansible_playbook(
        str(ANSIBLE_DIR / f"{playbook_name}.yaml"),
        _cwd=ANSIBLE_DIR,
        _out=sys.stdout,
        _err=sys.stderr
    )


def list_playbooks():
    """Lists all available playbooks."""
    print("Available playbooks:")
    playbook_files = sorted(ANSIBLE_DIR.glob("*.yaml"))
    if not playbook_files:
        print("No playbooks found.")
        return
    for yaml_file in playbook_files:
        playbook_name = yaml_file.name.removesuffix(".yaml")
        print(f"- {playbook_name}")
