from sh import ansible_playbook
import shutil
from pathlib import Path

# Project root
ROOT_DIR = Path(__file__).resolve().parent.parent
ANSIBLE_DIR = ROOT_DIR / "ansible"

def playbook(playbook_name: str):
    """Runs an Ansible playbook."""
    print(f"Running playbook {playbook_name}...")
    ansible_playbook(
        str(ANSIBLE_DIR / f"{playbook_name}.yml"),
        _cwd=ANSIBLE_DIR
    )


def list_playbooks():
    """Lists all available playbooks."""
    print("Available playbooks:")
    playbook_files = sorted(ANSIBLE_DIR.glob("*.yml"))
    if not playbook_files:
        print("No playbooks found.")
        return
    for yml_file in playbook_files:
        playbook_name = yml_file.name.removesuffix(".yml")
        print(f"- {playbook_name}")
