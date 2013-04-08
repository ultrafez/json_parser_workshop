require 'spec_helper'
require 'json_parser'

#
# *** Spec generously adapted from:
# *** http://json.org/
#
describe JavaScriptObjectNotationParser do
  let(:parser) { JavaScriptObjectNotationParser.new }

  def conversion_method_for_parse_as
    :to_hash
  end

  # Getting started

  describe "getting started" do
    example do
      #pending
      expect('').to parse_as(:nothing)
    end
  end

  describe "an empty object" do
    example do
      #pending
      expect('{}').to parse_as({ })
    end

    example do
      #pending
      # It's not important when you do this one,
      # it's just a sanity check
      expect('{   }').to parse_as({ })
    end
  end

  # String values

  describe "string values" do
    example do
      #pending
      expect('{ "a" : "b" }').to parse_as({ "a" => "b" })
    end

    example do
      #pending
      expect('{ "AbC 1dE" : "aBc 2De" }').to parse_as({ "AbC 1dE" => "aBc 2De" })
    end

    example do
      #pending
      expect('{ "AbC_1dE" : "aBc_2De" }').to parse_as({ "AbC_1dE" => "aBc_2De" })
    end

    example do
      #pending
      expect('{ "a" : "b" }').to parse_as({ "a" => "b" })
    end
  end

  describe "integer values" do
    example do
      #pending
      expect('{ "a" : 1 }').to parse_as({ "a" => 1 })
    end

    example do
      #pending
      expect('{ "a" : 123 }').to parse_as({ "a" => 123 })
    end

    example do
      #pending
      expect('{ "a" : -789 }').to parse_as({ "a" => -789 })
    end
  end

  describe "integer values" do
    example do
      #pending
      expect('{ "a" : 1.3 }').to parse_as({ "a" => 1.3 })
    end

    example do
      #pending
      expect('{ "a" : 1.367 }').to parse_as({ "a" => 1.367 })
    end
  end

  # Now it gets harder
  describe "multiple member pairs" do
    example do
      #pending
      expect(
        '{ "a" : "b" , "c" : "d" , "e" : "f" }'
      ).to parse_as(
        { "a" => "b", "c" => "d", "e" => "f" }
      )
    end
  end

  describe "objects as values" do
    example do
      #pending
      expect(
        '{ "a" : { "x" : "y"} }'
      ).to parse_as(
        { "a" => { "x" => "y" } }
      )
    end
    example do
      #pending
      expect(
        '{ "a" : {} }'
      ).to parse_as(
        { "a" => {  } }
      )
    end
  end

  # Serious extra credit!
  describe "arrays" do
    example do
      #pending
      expect('{ "a" : [] }').to parse_as({ "a" => [ ] })
    end

    example do
      #pending
      expect('{ "a" : [1] }').to parse_as({ "a" => [1] })
    end

    example do
      #pending
      expect('{ "a" : ["b"] }').to parse_as({ "a" => ["b"] })
    end

    example do
      #pending
      expect('{ "a" : [1,2,3] }').to parse_as({ "a" => [1, 2, 3] })
    end

    example do
      #pending
      expect('{ "a" : [ 1 , 2 , 3] }').to parse_as({ "a" => [1, 2, 3] })
    end

    example do
      #pending
      expect(
        '{ "a" : [1, { "b" : 2 }, 3] }'
      ).to parse_as(
        { "a" => [1, { "b" => 2 }, 3] }
      )
    end
  end

  describe "external" do
    example do     
      json = <<-JSON
      {
          "glossary": {
              "title": "example glossary",
          "GlossDiv": {
                  "title": "S",
            "GlossList": {
                      "GlossEntry": {
                          "ID": "SGML",
                "SortAs": "SGML",
                "GlossTerm": "Standard Generalized Markup Language",
                "Acronym": "SGML",
                "Abbrev": "ISO 8879:1986",
                "GlossDef": {
                              "para": "A meta-markup language, used to create markup languages such as DocBook.",
                  "GlossSeeAlso": ["GML", "XML"]
                          },
                "GlossSee": "markup"
                      }
                  }
              }
          }
      }
      JSON
      object = {
          "glossary"=> {
              "title"=> "example glossary",
          "GlossDiv"=> {
                  "title"=> "S",
            "GlossList"=> {
                      "GlossEntry"=> {
                          "ID"=> "SGML",
                "SortAs"=> "SGML",
                "GlossTerm"=> "Standard Generalized Markup Language",
                "Acronym"=> "SGML",
                "Abbrev"=> "ISO 8879:1986",
                "GlossDef"=> {
                              "para"=> "A meta-markup language, used to create markup languages such as DocBook.",
                  "GlossSeeAlso"=> ["GML", "XML"]
                          },
                "GlossSee"=> "markup"
                      }
                  }
              }
          }
      }
      expect(json).to parse_as(object)
    end
  end
end