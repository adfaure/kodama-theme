+++
title = "How to use this theme"
date = 2022-03-16
description = """
Example of how to use kodama theme.
"""
+++

## Summary

This theme is greatly inspired from hugo academic theme.

First lets introduce some technical details:
- It relies on [zola](https://getzola.com).
- It has no javascript.
- The CSS is built with [tailwindcss](https://tailwindcss.com/).
    - The blog articles are themed with [@tailwindcss/typography](https://tailwindcss.com/docs/typography-plugin) theme.

## Configuration

This theme use some extra configuration, that can be set in the extra section of your `config.toml`.

```toml
# Title displayed in the index page
title = "Website title"

[extra]

# Image of your avatar displayed on the landing page
avatar = "static/img/avatar.jpg"
# Image of the favicon
favicon = "static/img/avatar.jpg"

# Your email address showed in the contact section
email = "kodama[at]domain.com"

# If you don't want to show your contact information in the index
contact_in_index = true

# Additional menu items
# `Name` is what it is displayed, `path` is the url
menu_items = [
  { path = "#contacts", name = "Contact" },
]
```

## Index page

The information needed to build the index page are located in the page [front matter](https://www.getzola.org/documentation/content/page/#front-matter) of root index file (e.g `content/_index.md`).

The available configuration options are:

```toml
# Insert zola front matter variable such as date etc

[extra]

# Show a concise description of what you do below your avatar.
title = "Concise description"

# The list of interests displayed
interests = [
  "Rainbow pony",
  "Martian food",
  "Quantic science"
]

# The list of your degrees / education
[[extra.education.courses]]
  course = "Latest degree"
  institution = "Some acamedy"
  year = 2020

[[extra.education.courses]]
  course = "Another degree"
  institution = "Here and there"
  year = 2016

# Finally, a list of icons with a link displayed below your avatar
[[extra.avatar_icons]]
  icon = "github"
  link = "https://github.com/adfaure"
[[extra.avatar_icons]]
  icon = "gitlab"
  link = "https://gitlab.com/adfaure"
[[extra.avatar_icons]]
  icon = "linkedin"
  link = "https://www.linkedin.com/in/adrien-faure-9958978b/"
```
## Contact

The predefined contact page can be use.
The front matter extra part should contains a list of the link to show in the contacts.

## Sections

The section available in your website are automatically detected and displayed in the nav bar at the top of the page.
To prevent a section to be displayed in the nav bar, you can set the extra front matter option `extra.hidden_nav = false` to false.

By default, the sections (i.e folders under `content/section_name`) have a summary showed in the index.
This is configurable in the front matter of the section (e.g `content/section_name/_index.md`).

```toml
# The name displayed in the section summary
extra.index_title = "Recent Posts"
# Set to false to remove the section from the index
extra.index_show = true
```

### Blog

The section `blog` is the most standard section. It show a list of article with things that you want to share in your website.
To use the blog template, configure the section with the following front matter:

```toml
template = "blog.html"
page_template = "blog-page.html"
```

### Publications

The section `publication` is very similar to the `blog` section however it is dedicated to show your list of scientific articles.
The articles are showed in two subcategories: Thesis and Conference / Workshop.

To configure a publication section (e.g `content/research`) and set the following content:

```md
+++
title = "Research"
sort_by = "date"

# Here the two dedicated templates
template = "publications.html"
page_template = "publication-page.html"
+++

## Content

Any content will be displayed on top of the section.
```

Article are referenced in subdirectories of this section.
```
tree content/research
content/research
├── _index.md
├── paper1
│   ├── bib
│   └── index.md
└── thesis
    ├── bib
    ├── index.md
    ├── thesis.pdf
    └── thesis_slides.pdf
```

The bib files are automatically loaded to get information from it. However, it is also possible to add information in the front matter of the article markdown file.

```markdown
+++
title = "Article 1"
date = 2021-05-18

[extra]
type = "Conference"
authors = [ "Kodama Mononoke" ]
publication_types = "Conference paper"
featured = true
publication = "2020 IEE rainbow workshop"
url_pdf = "https://your-pdf"
url_slides = "path_to_slides"
+++
```

## Icons

The icons available in this project are stored in a dedicated macro function in `templates/macros/icons.html`.
To add a new svg, you can add a case in the `if elif .. else` of the function containing the svg copied from [heroicons](https://heroicons.com/) for instance.