# What is Kickstart?

Kickstart.nvim is _not_ a distribution.

Kickstart.nvim is a starting point for your own configuration.
The goal is that you can read every line of code, top-to-bottom, understand what your configuration is doing, and modify it to suit your needs.

Once you've done that, you can start exploring, configuring, and tinkering to make Neovim your own! That might mean leaving Kickstart just the way it is for a while or immediately breaking it into modular pieces. It's up to you!

If you don't know anything about Lua, I recommend taking some time to read through a guide. One possible example which will only take 10-15 minutes:

- [Learn Lua in Y Minutes](https://learnxinyminutes.com/docs/lua/)

After understanding a bit more about Lua, you can use `:help lua-guide` as a reference for how Neovim integrates Lua:

- `:help lua-guide`
- [HTML version](https://neovim.io/doc/user/lua-guide.html)

---

# Kickstart Guide

## Step 1: Run `:Tutor`

The very first thing you should do is to run the command `:Tutor` in Neovim.

If you don't know what this means, type the following:

- `<escape key>`
- `:`
- `Tutor`
- `<enter key>`

_(If you already know the Neovim basics, you can skip this step.)_

---

## Step 2: Read the Kickstart `init.lua`

Once you've completed the `:Tutor` step, you can continue working through **AND READING** the rest of the Kickstart `init.lua`.

---

## Step 3: Run and Read `:help`

Next, run AND READ `:help`.
This will open up a help window with some basic information about reading, navigating, and searching the built-in help documentation.

This should be the first place you go to look when you're stuck or confused with something. It's one of my favorite Neovim features.

### Keymap for Help Search

MOST IMPORTANTLY, Kickstart provides a keymap `<space>sh` to [s]earch the [h]elp documentation, which is very useful when you're not exactly sure of what you're looking for.

---

## Helpful Comments in `init.lua`

I have left several `:help X` comments throughout the `init.lua`.
These are hints about where to find more information about the relevant settings, plugins, or Neovim features used in Kickstart.

### Example Comment Format

Look for lines like this throughout the file. These are for you, the reader, to help you understand what is happening.

Feel free to delete them once you know what you're doing, but they should serve as a guide for when you are first encountering a few different constructs in your Neovim config.

---

## Troubleshooting

If you experience any errors while trying to install Kickstart, run `:checkhealth` for more info.

---

## Final Note

I hope you enjoy your Neovim journey,
— TJ

P.S. You can delete this when you're done too. It's your config now! :)
