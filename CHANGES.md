# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [unreleased]

### Added

#### Support for multilanguage site

This new version adds the support for [multilanguage](https://www.getzola.org/documentation/content/multilingual/) site.

**If you don't need it, the only change that you need to do is to is to add the following content to your `config.toml` file.**

```toml
[translations]
Biography = "Biography"
Published = "Published"
Interests = "Interests"
Education = "Education"
Abstract = "Abstract"
```

A new translation can be added following the zola official documentation.
The only requirements are:
- add a new extra configuration containing the languages code that you have.
- add a `menu_items` for each languages under the `extra.language_code` (language_code need to correspond to the actual code).

For instance:

```toml
[extra]
language_codes = [ "en", "fr" ]

[extra.fr]
menu_items = [
  { path = "#contacts_fr", name = "Contact" },
]
```

### Removed

- The macro nav takes only one parameter now (the title of the website).


### Changed

- Many refactor and code cleaning

## [1.0.1]

### Fixed

- Fix wrong variable in readme. In publication content, `publication_types` is now `type`

## [1.0.0]

### Added

This is the first release.
The readme includes the details of all the available features.
