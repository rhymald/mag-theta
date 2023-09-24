# mag-theta
P2P gaming server designing, 8th attempt

# V-lang

- Test: `v -stats test .`
- Run: `v run .`
- Build: `v -o binary-filename .`

Install V:
```bash
sudo apt-get install gcc make
git clone https://github.com/vlang/v
cd v
make
sudo ln -s $(pwd)/v /usr/local/bin/v
```
## CheatSheets

- `pub` - accessible for other modules
- `import` - folder+module
- `..._test.v` - test files
- `v install module` - install module "module"
- memory management: -gc / -prealloc / -autofree (default)