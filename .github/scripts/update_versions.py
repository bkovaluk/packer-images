import os
import re
import requests

# Define the files to update and the tools to check
files_to_update = [
    {
        "file_path": "images/deploy/variables.pkr.hcl",
        "tools": [
            {
                "name": "terraform",
                "variable_name": "terraform_version",
                "current_version_pattern": r'terraform_version\s*=\s*"(.+?)"',
                "release_api": "https://api.releases.hashicorp.com/v1/releases/terraform",
            },
            {
                "name": "packer",
                "variable_name": "packer_version",
                "current_version_pattern": r'packer_version\s*=\s*"(.+?)"',
                "release_api": "https://api.releases.hashicorp.com/v1/releases/packer",
            },
        ],
    },
    # Add other files and tools as needed
]

def get_latest_version(release_api):
    response = requests.get(release_api)
    if response.status_code == 200:
        data = response.json()
        versions = data.get('versions', [])
        versions = [v for v in versions if not v.get('prerelease') and not v.get('version').startswith('beta')]
        versions.sort(key=lambda x: x['version'], reverse=True)
        if versions:
            return versions[0]['version']
    return None

for file_info in files_to_update:
    file_path = file_info['file_path']
    tools = file_info['tools']

    with open(file_path, 'r') as file:
        content = file.read()

    original_content = content

    for tool in tools:
        current_version_match = re.search(tool['current_version_pattern'], content)
        if current_version_match:
            current_version = current_version_match.group(1)
            latest_version = get_latest_version(tool['release_api'])
            if latest_version and latest_version != current_version:
                print(f"Updating {tool['name']} from version {current_version} to {latest_version}")
                content = re.sub(
                    tool['current_version_pattern'],
                    f'{tool["variable_name"]} = "{latest_version}"',
                    content,
                )

    if content != original_content:
        with open(file_path, 'w') as file:
            file.write(content)
