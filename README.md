[![Docker Repository on Quay](https://quay.io/repository/mojanalytics/concourse-ecr-resource/status "Docker Repository on Quay")](https://quay.io/repository/mojanalytics/concourse-ecr-resource)

# ECR Repository Resource

Provides a Concourse resource to create AWS ECR repositories. Used to create a
repository on the fly when deploying a webapp on the Analytical Platform, where
the webapp docker images are stored.

## Resource configuration

These parameters go into the `source` fields of the resource type. Bold items are required:

| Parameter | Description |
| --------- | ----------- |
| **`name`** | Name of the repository to create |
| `access_key_id` | AWS Access Key ID |
| `secret_access_key` | AWS Secret Access Key |
| `region` | AWS Region |

# Behaviour

### `check`: Not Supported

### `in`: Not Supported

### `out`: Create Repository

Creates a repository with the specified name if it does not exist.

## Installation

This resource is not included with Concourse CI. You must integrate this resource in the `resource_types` section of your pipeline.

```yaml
resource_types:
- name: ecr-repo
  type: docker-image
  source:
    repository: quay.io/mojanalytics/concourse-ecr-resource
    tag: 0.1.0

resources:
- name: webapp-ecr-repo
  type: ecr-repo
  source:
    name: ((ecr-repo-name))
    access_key_id: ((aws-access-key-id))
    secret_access_key: ((aws-secret-access-key))
    region: ((aws-default-region))

jobs:
- name: deploy
  plan:
  - put: webapp-ecr-repo
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b feature/new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/new-feature`
5. Submit a pull request.

## License

[MIT Licence (MIT)](LICENCE)
