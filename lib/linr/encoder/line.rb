module Linr
  module Encoder
    # Encodes data entry into the InfluxDB line format.
    # @see https://influxdb.com/docs/v0.9/write_protocols/write_syntax.html
    # @example Encode a data series
    #   Line.new.dump(Data.new(measurement: "series", fields: { a: 0.5 }))
    class Line
      # Encodes data into the line syntax
      # @param data [Data]
      # @return [String]
      def dump(data)
        [
          dump_measurement(data.measurement),
          dump_tags(data.tags),
          dump_fields(data.fields),
          dump_timestamp(data.timestamp)
        ].compact.join
      end

      private

      def dump_measurement(measurement)
        escape_key(measurement)
      end

      def dump_tags(tags)
        dump_collection(tags, ",") do |key, value|
          "#{escape_key(key)}=#{escape_value(value)}"
        end
      end

      def dump_fields(fields)
        dump_collection(fields) do |key, value|
          "#{escape_key(key)}=#{encode_field_value(value)}"
        end
      end

      def dump_timestamp(timestamp)
        " #{timestamp}" if timestamp
      end

      def dump_collection(data, prefix = " ", &block)
        return unless data && !data.empty?
        prefix + data.map(&block).join(",")
      end

      def encode_field_value(value)
        case value
        when Numeric
          encode_numberic(value)
        when TrueClass, FalseClass
          value.to_s
        else
          escape_quote(escape_value(value))
        end
      end

      def encode_numberic(value)
        return "#{value}i" if value.is_a?(Integer)
        value
      end

      def escape_value(input)
        input.to_s
             .gsub(/\s/, '\ ')
             .gsub(",", '\,')
             .gsub('"', '\"')
      end

      def escape_quote(input)
        %("#{input}")
      end

      def escape_key(input)
        input.to_s
             .gsub(/\s/, '\ ')
             .gsub(",", '\,')
      end
    end
  end
end
