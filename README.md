This repo holds the files used to build the [DICE Lab website](https://parameterizeit.github.io/) and the rendered HTML files that are hosted by GitHub Pages.

The website is built with [Quarto](https://quarto.org/docs/websites/), making use of a simple but reasonably expressive flavor of [Markdown](https://quarto.org/docs/authoring/markdown-basics.html) to edit the content that is then rendered into static HTML webpages according to a YAML theme. The main content editing is done on files with a `.qmd` file extension.

# General editting workflow
This guide assumes that you have Git set up to work with your GitHub account and RStudio. There are a large number of tutorials out there if you haven't done this yet. I like [this one](https://bcknr.github.io/IntroToGit/) for a minimalist startup and [this one](https://happygitwithr.com/) for an accessible guide that digs a layer deeper into Git functions. For Git-based tasks, links to a specific tutorial are provided.

Lab members should use a fork & pull request workflow to propose edits to the website, including fixing, updating content, or adding new resources.
1. [Fork this repo](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo). This will create a copy for which you have full editing control over everything, effectively working as a scratch space for you to try out your edits without directly publishing to the public-facing website.
2. On the forked repo, make your edits, commit them, and push to GitHub. By default, these edits will be public, but will only exist in your forked copy.
3. [Open a pull request](https://github.com/parameterizeit/parameterizeit.github.io/compare). This will alert the site admin that you have proposed edits that need review. Keep your fork of the repo until the pull request with your edit has been merged into the main repo.

# Where to find a particular file
- The homepage (`index.qmd`) and most other pages directly linked from top menu bar are located in the top-level directory.
- Subfolders collect the `.qmd` files that fall within the `people/`, `publications/`, and `research/` categories.
  - A subfolder for each person is located within `people/` and contains `about.qmd` that contains the content for their page, their photo/avatar in `avatar.jpg`, and any other static files that are only linked from their `about.qmd` page (e.g., a curriculum vitae).
- `scripts` holds code files used to generate website content or perform maintenance tasks.
- `static` holds files that do not relate to a specific person and that may be used on any page. Most of these files are images.

# How-to guide for common tasks
## Preview edits
1. Make edits to a source `.qmd` file and save.
2. In the 'Terminal' tab of RStudio, enter `quarto preview`. This will launch your default web browser with a preview of the whole website.
3. Check functionality of your edited page. Do the text and images appear as you expect? Do all the links work?

## Add a person
1. Create a new folder in the `people/` directory. The naming convention is `[family name]-[first letter of given name]`, all in lower case. For example, "Will Petry" becomes "petry-w". This will be the folder where all content related to that person is stored.
2. Make a copy of `people/about-template.qmd`, put it in the new person's folder, and rename it to `about.md`.
3. Edit the content of `people/[family name]-[first letter of given name]/about.qmd`. The template includes comments with tips and a formatting/style guide.
4. Finally, edit `people.qmd` (located in the top-most folder) to make the person appear on the main "People" page and make their detailed about page findable.
   - Insert their image under the correct subheading. Currently this is arranged chronologically by the date the person joined the DICE Lab. The image should be aligned LEFT, 3 inches in width, and include a link to `people/[family name]-[first letter of given name]/about.qmd`.
   - Write the person's name in **bold text** below the image, then add " [about]" in regular text next to that. Add a link to "[about]" that points to `people/[family name]-[first letter of given name]/about.qmd`.
   - Copy any other links in square brackets from the person's about page and paste them after "[about]".
   - On a new line, add the person's current role and date of association in regular text.
  
## Move a person to Alumni
1. Open `people.qmd` (located in the top-most folder) and delete their entry.
2. Open `alumni.qmd` (located in the top-most folder) and add a bullet point entry under the appropriate category following the format of previous entries. The current sorting order is reverse chronological, so the most recent departures should be at the top of the list in each category. We welcome a statement in *italics* that tells us about your next professional pursuit! 
3. (optional) Add a link to the person's name that points to either:
   - Their `people/[family name]-[first letter of given name]/about.qmd` page, updated to add their departure year.
   - A professional webpage maintained by the person. This is pretty free-form. It could be a professional website the person created, a page on their new lab's webpage, a LinkedIn profile, or similar.
  
## Add a publication
1. Open `publications.qmd` (located in the top-most folder). Add a citation for the publication to the appropriate category, making sure to follow the existing citation style.
2. Add links in square bracket fields for [doi] [pdf] [data] [code].
   - [doi] should be a digital object identifier resolver link in the form https://doi.org/[publication doi].
   - [pdf] should be link to `publications/[Lead author] et al. - [YYYY] - [Title or beginning several words of title].pdf`.
   - [data] should be a link to the data repository where the study data are archived. Delete [data] if not relevant (e.g., a review paper).
   - [code] should be a link to the code repository where the reproducible code are archived (if different from the [data] archive). Delete [code] if not relevant (e.g., a review paper or combined data+code archive).
3. (optional) Copy the entry from the `publications.qmd` page to the **Selected publications** list on the `about.md` pages of DICE Lab co-authors and/or on the related project page in `projects/`. Usually the latter makes the most sense for major publications, or those that are the first papers that come from one of the specific aims described on the project page.
