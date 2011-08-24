# Issues since Tag
_Answers the question "What did/should we got in with this deploy?"_

Issues_since_tag displays the issues related to commits since a given
tag. It assumes that:
  * there is an repository configured with a project
  * you create tags for each deploy

It supports only git, at the moment. But support for other version
control systems should be a piece of cake.

## Install it

As a submodule:

> git submodule add git://github.com/artflakes/issues_since_tag.git
> vendor/plugins/issues_since_tag

As a ordinary plugin:

> plugin install git://github.com/artflakes/issues_since_tag.git

## Configure it

### in redmine

Go to a project, klick on settings, then modules and check "Issues since
tag" to activate it for this project.

### in your vcs

Build some magic which create a tag at each deploy. If you use
capistrano, like we do, you could use this snippet:

> task :push_deploy_tag do
>   user = `git config --get user.name`.chomp
>   email = `git config --get user.email`.chomp
>   puts `git tag #{Time.now.strftime("%y-%m-%d-%H%M-") + current_revision} -m "Deployed by #{user} <#{email}>"`
>   puts `git push --tags origin`
> end

And that's it! :)

## Contribute!

Please do! Just fork it, make your changes and send us a pull request.

## Authors

This plugin is build by [acid](http://github.com/acid)
