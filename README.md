# Nageraser

  This is a compiler of timesheet information so that I stopped getting nagged
on timesheets.

  I use RescueTime to automatically track what I do on various devices /
computers. I needed a way to consolidate some of tasks into projects (ie. When
I'm working on Prompt on iOS, then it is most likely that I'm writing code for
Project A).

## Usage

  This is still to come. It isn't quite ready yet.

```
# Yes, I know theres a missing 'e'

nagerasr 'job' <startrange> <endrange>
```

## Config File

You'll need a YAML config file that relates jobs, into roles / categories to the
activities from RescueTime.

```
this_is_jobs:
  some_category:
    activity_1
    activity_2
    activity_3
  some_other_category:
    activity_1
    activity_2
    activity_3
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rsmacapinlac/nageraser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

