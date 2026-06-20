# DJH-Image-Optimizer
Professional Windows batch image optimization pipeline for website owners, bloggers, developers, and SEO specialists. Automatically converts images to JPG, WebP, and AVIF, generates SEO-ready HTML, JSON manifests, CDN-friendly filenames, date-versioned assets, and optimized outputs for modern websites. by DJH.ir

![Version](https://img.shields.io/badge/version-v8.2-blue)
![Platform](https://img.shields.io/badge/platform-Windows-green)
![Batch](https://img.shields.io/badge/language-Batch-yellow)
![Python](https://img.shields.io/badge/python-3.12-blue)
![ImageMagick](https://img.shields.io/badge/ImageMagick-Required-purple)
![AVIF](https://img.shields.io/badge/AVIF-Supported-orange)
![WebP](https://img.shields.io/badge/WebP-Supported-brightgreen)
![SEO](https://img.shields.io/badge/SEO-Ready-success)
![CDN](https://img.shields.io/badge/CDN-Friendly-blueviolet)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

Alternative Names
DJH Image Optimizer
DJH AI CDN Image Pipeline
DJH SEO Image Optimizer
DJH Image Compression Suite
DJH Batch Image Optimizer
DJH WebP AVIF Converter
DJH Static Image CDN Generator
DJH SEO Image Pipeline
DJH Website Image Toolkit
DJH Smart Image Publisher

# DJH Image Optimizer v8.2 AI CDN

Professional Image Optimization Pipeline for Modern Websites

![Version](https://img.shields.io/badge/version-v8.2-blue)
![Platform](https://img.shields.io/badge/platform-Windows-green)
![Python](https://img.shields.io/badge/python-3.12-blue)
![ImageMagick](https://img.shields.io/badge/ImageMagick-Required-purple)
![AVIF](https://img.shields.io/badge/AVIF-Supported-orange)
![WebP](https://img.shields.io/badge/WebP-Supported-brightgreen)
![SEO](https://img.shields.io/badge/SEO-Ready-success)

---

## Overview

DJH Image Optimizer is a production-oriented image processing pipeline designed for bloggers, website owners, WordPress developers, SEO specialists, and content creators who need a fast and repeatable way to optimize images for the modern web.

Instead of manually creating multiple image formats, renaming files, generating HTML code, and maintaining image assets, this tool automates the entire workflow with a single drag-and-drop operation.

The script generates:

* Optimized JPG images
* Optimized WebP images
* Optimized AVIF images
* SEO-ready HTML snippets
* JSON image manifests
* CDN-friendly filenames
* Date-versioned assets

The goal is simple:

Create smaller images, faster websites, better SEO scores, and easier content publishing.

---

# Why This Project Exists

Modern websites require multiple image formats.

A single uploaded image often needs:

* JPG fallback
* WebP version
* AVIF version
* Lazy loading support
* Responsive HTML
* CDN compatibility
* Proper file naming

Performing these tasks manually is time consuming and error prone.

This project was created to automate those repetitive tasks and provide a simple workflow that works entirely on Windows.

The script is especially useful for:

* WordPress websites
* Personal blogs
* Static websites
* Portfolio websites
* Documentation sites
* SEO-focused projects

---

# Features

## Multi-Format Conversion

Automatically creates:

* JPG
* WebP
* AVIF

from a single source image.

---

## Automatic Optimization

All outputs are resized to a maximum of:

900 × 900 pixels

to reduce bandwidth consumption.

---

## CDN Friendly Naming

Generated filenames include:

* Sanitized names
* Consistent suffixes
* Date-based versioning

Example:

my-image_djhir-20260620.webp

---

## SEO HTML Generator

Automatically generates HTML picture elements.

Example:

```html
<picture>
    <source srcset="image.avif" type="image/avif">
    <source srcset="image.webp" type="image/webp">
    <img src="image.jpg" loading="lazy">
</picture>
```

---

## JSON Manifest Generation

Creates machine-readable metadata.

Useful for:

* CMS integrations
* Static site generators
* Deployment pipelines
* CDN synchronization

---

## Batch Processing

Supports processing multiple images in a single run.

Simply drag all images onto the BAT file.

---

## AVIF Support

Uses Pillow + pillow-avif for next-generation image compression.

---

# Requirements

## Operating System

Windows 10 or newer

---

## Python

Python 3.12+

Required for AVIF generation.

---

## ImageMagick

Required for JPG and WebP generation.

---

## Python Packages

Install:

```bash
pip install pillow
pip install pillow-avif-plugin
```

---

# Workflow

1. Prepare source images.
2. Select one or more files.
3. Drag them onto the BAT script.
4. Wait for processing.
5. Review generated files.
6. Copy generated HTML into your website.
7. Upload optimized assets to your CDN or server.

---

# Daily Usage

A typical workflow for bloggers:

1. Create article.
2. Export screenshots.
3. Drag screenshots onto the script.
4. Receive optimized formats.
5. Upload files.
6. Copy generated HTML.
7. Publish article.

The entire process usually takes less than one minute.

This makes the tool particularly useful for websites that publish content regularly.

---

# Safety Features

* Original images remain untouched
* New files are created separately
* Automatic validation of AVIF generation
* Predictable output naming
* Date-versioned assets
* Repeatable processing

---

# Example

Input:

photo.png

Output:

photo_djhir-20260620.jpg

photo_djhir-20260620.webp

photo_djhir-20260620.avif

image-seo-index-20260620.html

image-manifest-20260620.json

sitemap-images-20260620.xml

---

# Advantages

## Faster Websites

Smaller images reduce loading times.

## Better SEO

Search engines reward fast websites.

## Lower Bandwidth Costs

Compressed formats consume less traffic.

## Modern Format Support

WebP and AVIF are increasingly adopted by modern browsers.

## Easier Content Publishing

Automates repetitive image tasks.

---

# Customization

Advanced users can modify:

* JPG quality
* WebP quality
* AVIF quality
* Resize limits
* Output directories
* CDN paths
* Naming conventions

All settings are centralized within the script.

---

# Performance Notes

The tool is optimized for:

* Medium-sized image libraries
* Blog publishing
* Portfolio websites
* SEO projects

Processing speed depends primarily on:

* CPU performance
* Storage speed
* Image dimensions

---

# FAQ

### Does the script modify original files?

No.

Original images remain unchanged.

### Does it support PNG?

Yes.

Any format supported by ImageMagick can generally be processed.

### Why generate AVIF?

AVIF typically offers superior compression compared to JPG and WebP.

### Can I change output dimensions?

Yes.

Modify the resize settings inside the script.

### Is WordPress supported?

Yes.

The generated HTML is suitable for WordPress posts and pages.

---

# Roadmap

Future ideas:

* Recursive folder processing
* Automatic thumbnail generation
* Responsive srcset support
* Metadata extraction
* EXIF reporting
* Image quality analysis
* Watermark support
* Bulk folder mode

---

# License

MIT License

---

# Author

DJH

https://djh.ir

---

# Support

If this project helped you:

⭐ Star the repository

🍴 Fork the repository

🛠 Contribute improvements

📢 Share with other developers

Every star helps the project grow.


Suggested GitHub Topics
image-optimizer
image-compression
webp
avif
jpg
seo
cdn
imagemagick
batch-script
windows
static-site
web-performance
google-pagespeed
website-optimization
image-processing
developer-tools
automation
python
blogging
wordpress

# Changelog

## v8.2
- Added YYYYMMDD filename suffix
- Improved CDN cache busting
- Improved output consistency
- Enhanced manifest generation
- Updated SEO HTML generation
