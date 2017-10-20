# install
The repository for `angel install` add-ons.

# Example `angel_cli.yaml`

```yaml
templates:
        - hello.txt
        - foo/bar.txt
values:
        name:
                type: prompt
        mackle:
                type: choice
                description: Macklemore
                choices:
                        - Rap
                        - Artist
                        - LOL
        artist:
                type: prompt
                description: Your favorite artist
                default: Michael Jackson
```
