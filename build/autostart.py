#!/usr/bin/env python3
import os
import subprocess
from typing import List


def get_autostart_commands() -> List[str]:
	return [c for c in [cmd.strip() for cmd in os.getenv('AUTOSTART', '').split(':')] if c]


def execute_command_in_background(command: str) -> None:
	subprocess.call(str(command) + ' &', shell=True)


def main():
	for command in get_autostart_commands():
		print(f'Running {command}')
		execute_command_in_background(command)


if __name__ == '__main__':
	main()
