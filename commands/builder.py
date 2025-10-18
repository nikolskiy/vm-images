from sh import packer
import shutil
from pathlib import Path

# Project root
ROOT_DIR = Path(__file__).resolve().parent.parent

PACKER_BUILDS_DIR = ROOT_DIR / "packer/builds"
BUILD_DIR = ROOT_DIR / "builds"
PACKER_COMMON_VARS = ROOT_DIR / "packer/common/variables.pkr.hcl"

def build(vm_name: str):
    """Builds a VM image using Packer."""
    print(f"Building VM image for {vm_name}...")
    packer.init(
        ".",
        _cwd=ROOT_DIR
    )
    packer.build(
        "-var-file", str(ROOT_DIR / "packer/common/dev.auto.pkrvars.hcl"),
        str(PACKER_BUILDS_DIR / f"{vm_name}.pkr.hcl"),
        _cwd=ROOT_DIR
    )

def validate(vm_name: str):
    """Validates a Packer template."""
    print(f"Validating Packer template for {vm_name}...")
    #packer.validate(
    #    "-var-file", str(PACKER_COMMON_VARS),
    #    str(PACKER_BUILDS_DIR / f"{vm_name}.pkr.hcl"),
    #    _cwd=ROOT_DIR
    #)
    print(
        "-var-file", str(PACKER_COMMON_VARS),
        str(PACKER_BUILDS_DIR / f"{vm_name}.pkr.hcl"),
    )

def clean():
    """Cleans up build artifacts."""
    print("Cleaning up build artifacts...")
    
    builds_dir = BUILD_DIR
    if builds_dir.exists():
        for item in builds_dir.iterdir():
            if item.is_dir():
                shutil.rmtree(item)
            else:
                item.unlink()

    packer_cache = ROOT_DIR / ".packer_cache"
    if packer_cache.exists():
        shutil.rmtree(packer_cache)

    packer_log = ROOT_DIR / "packer.log"
    if packer_log.exists():
        packer_log.unlink()

def list_vms():
    """Lists all available VM builds."""
    print("Available VM builds:")
    packer_files = sorted(PACKER_BUILDS_DIR.glob("*.pkr.hcl"))
    if not packer_files:
        print("No VM builds found.")
        return
    for pkr_file in packer_files:
        vm_name = pkr_file.name.removesuffix(".pkr.hcl")
        print(f"- {vm_name}")
