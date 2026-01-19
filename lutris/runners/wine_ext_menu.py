"""Base module for runners"""

import os
import signal
from gettext import gettext as _
from typing import Any, Callable, Dict, Iterable, Optional, Set

from lutris import runtime, settings
from lutris.api import format_runner_version, get_default_runner_version_info
from lutris.config import LutrisConfig
from lutris.runners.commands.wine import wineexec

import argparse



def run_exe_alone(exec_str):
    ARCH = "win64"
    wine_set_path = "home/zebra2711/.wine_ext"
    set_working_dir = "/tmp/"
    set_config = "?" # default one or make neww yml like ext_menu.yml?
    runner = import_runner("wine")()
    wineexec(
        executable=exec_str,
        prefix=prefix,
        args=args,
        wine_path=wine_set_path,
        arch=ARCH,
        working_dir=set_working_dir,
        config=set_config,
        #include_processes: Optional[list] = None,
        #exclude_processes: Optional[list] = None,
        env=env,
        overrides=None,
        disable_runtime=disable_runtime,
        runner=runner,
        proton_verb=proton_verb,
    )
def main():
    parser = argparse.ArgumentParser(description="Run exe directly")
    parser.add_argument("-p", "--path", help="exe path", type=str)
    args = parser.parse_args()
    _path = args.path
    run_exe_alone(_path)
    return

if __name__ == "__main__":
    main()
