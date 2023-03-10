# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [unreleased]

New major release, that adds multilanguage support, and a new template block that can be override by users.
And, some (small) breaking changes have been done so check the changelog to upgrade your site.

### Added

#### Add block for header customization

A new empty block in base.html named `user_head` has been added allows users to customize the head of their pages easily. You can now add custom meta tags, CSS, and JavaScript to the head of their pages.

Example (file: `yoursite/templates/base.html`):
```tera
{% extends "kodama-theme/templates/base.html" %}

{% block user_head %}
<script>console.log("hello world!")</script>
{% endblock user_head %}
```

#### Support for multilanguage site

Added support for multilanguage thanks to [Piotr Beling](https://github.com/beling).
The zola documentation can now be used to add a new languages, [multilanguage](https://www.getzola.org/documentation/content/multilingual/).

##### If you don't need it

The only change that you need to do is to is to add the following content to your `config.toml` file.

```toml
[translations]
Biography = "Biography"
Interests = "Interests"
Education = "Education"
toc = "Table of Contents"
Published = "Published"
Abstract = "Abstract"
volume = "volume"
number = "number"
pages = "pages"
```

##### If you want to add a new translation

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

### Changed

- The template `blog.html` has been renamed to `section.html`
- The macro nav takes only one parameter now (the title of the website).
- Many refactor and code cleaning

### Removed

## [1.0.1]

### Fixed

- Fix wrong variable in readme. In publication content, `publication_types` is now `type`

## [1.0.0]

### Added

This is the first release.
The readme includes the details of all the available features.
