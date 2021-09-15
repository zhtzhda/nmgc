# Node Modules Garbage Cleaner

This module allows you to remove `package-lock.json` and `node_modules` from your project. Also you has a clean installation of your npm packages.

<a href="https://nodei.co/npm/nmgc">
  <img src="https://nodei.co/npm/nmgc.png?downloads=true">
</a>

[![npm version](https://img.shields.io/npm/v/nmgc.svg?style=flat-square)](https://badge.fury.io/js/nmgc)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/LuisFuenTech/nmgc/blob/master/LICENSE)
[![NodeJS](https://img.shields.io/badge/node-6.x.x-brightgreen?style=flat-square)](https://github.com/LuisFuenTech/nmgc/blob/master/package.json)
[![install size](https://packagephobia.now.sh/badge?p=nmgc)](https://packagephobia.now.sh/result?p=nmgc)
[![npm downloads](https://img.shields.io/npm/dm/nmgc.svg?style=flat-square)](http://npm-stat.com/charts.html?package=nmgc)

# Compatibility

The minimum supported version of Node.js is v6.

# Usage

## Installation

```bash
$ npm i -g nmgc
```

Or use with `npx`

```bash
$ npx nmgc remove[r, install, i] [options]
```

## Example

# Commands

Usage: nmgc \<command\> [args]

- `remove` or `r`: Remove package-lock.json and node_modules
- `install [args]` or `i [args]`: Clean dependencies and install them from package.json"
  - `[args]`: Options for npm install

# License

[MIT](https://github.com/LuisFuenTech/nmgc/blob/master/LICENSE)
