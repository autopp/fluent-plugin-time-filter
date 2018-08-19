# fluent-plugin-time-filter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fluent-plugin-time-filter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-time-filter

## Parameters

| name | type | required? | description |
|---|---|---|
| `@type` | string | yes | The value must be `time` |
| `threshold` | integer | yes | Threshold for filtering by timestamp. Events whose timestamp is older than `threshold` seconds ago are filtered out. |

## Example

Configuration:

```
<filter foo.bar>
  @type time
  threshold 60
</filter>
```

When the following events pass through this filter at `2018-08-19 22:00:00`:

```
["foo.bar", "2018-08-19 21:58:59 +0900", { number: 1 }]
["foo.bar", "2018-08-19 21:59:00 +0900", { number: 2 }]
["foo.bar", "2018-08-19 21:59:01 +0900", { number: 3 }]
```

only the last two are passed to the next step of the pipeline, the first one is discarded.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/autopp/fluent-plugin-time-filter.

## License

[Apache License 2.0](LICENSE.txt)

## Author

[@AuToPP](https://twitter.com/AuToPP)
