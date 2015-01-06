# PushNinja

> Easiest way to push devices to PushNinja

## Configuration

PushNinja gem uses 3 parameters :

- env : can be `:staging` or `:production`
- default_platform_id : must be an integer. This parameter can be overrided into device parameters pushed to gem.
- authentification_token : key represented as a string. Must be provided by PushNinja administrator.

Example : 
```ruby
PushNinja.config do |config|
  config.env = :staging
  config.default_platform_id = 8
  config.authentification_token = ENV['PUSHNINJA_AUTHENTIFICATION_TOKEN']
end
```

## Usage
To send device data to PushNinja, you must call `PushNinja::Exporter.send_device` method. This method except a hash representing device data as a parameter. 

Hash format :
```ruby
    {
      device: {
        token: "12345-12345-12345", // APNS or GCM push token identifier
        platform_id: PushNinja.default_platform_id, // PushNinja platform ID
        enabled: true, // or false to disable this device for push
        properties_attributes: [
        {
            attribute: "email", // slug
            attribute_label: "Adresse email", // label displayed
            storage_type: :single, // can be :multiple too,
            attribute_value: "single_value", // if storage_type is :single
            attribute_values: ["array", "of", "values"] // if storage_type is :multiple
        },
        //...
        ]
      }
    }
```

