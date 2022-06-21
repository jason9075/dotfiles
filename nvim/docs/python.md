# Setup dependency lib

## format
```
pip install neovim
pip install flake8
pip install black
pip install mypy
```

## dap
```
pip install debugpy
```

## flake8
[How to set max line length per rpoject?](https://stackoverflow.com/questions/42325453/per-project-flake8-max-line-length)

Put ```setup.cfg``` in project root.
```
[flake8]
max-line-length = 120
```

