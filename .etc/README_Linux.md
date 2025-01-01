# Arch Linux + EndeavourOS

## Feker Galaxy80 mechanical keyboard (+ maybe some others)

Keyboard information and description:

- <https://epomaker.de/products/epomaker-feker-galaxy80>
- <https://www.amazon.de/EPOMAKER-Galaxy80-MechanischeTastatur-Aluminiumlegierung-Bluetooth/dp/B0CQ4LYPS2>

Related useful links:

- <https://www.reddit.com/r/Epomaker/comments/1bte204/comment/l0trju0/>
- <https://gist.github.com/Joao-Peterson/d9b327b17933a128ee6d94c4c418df0c?permalink_comment_id=4769646#gistcomment-4769646>
- <https://gist.github.com/Joao-Peterson/dbd6ee1abe480afd6094d266af7ab051>

```zsh
# `fnmode=2` seems to be suitable too (have to check it)
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
echo "options hid_apple fnmode=0" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo dracut --regenerate-all --force
sudo reboot
```
