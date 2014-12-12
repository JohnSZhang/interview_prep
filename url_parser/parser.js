var Parser = function (template) {
  this.template = template ? template : "/:version/api/:collecton/:id";
  this.resetTemplate(this.template);
}

Parser.prototype.resetTemplate = function(template) {
  this.format = [];
  var template = template.slice(1).split('/')
  for (var i = 0 ; i < template.length; i++) {
    this.format[i] = template[i]
  }
};

Parser.prototype.checkFormat = function (string) {
  var result = parseInt(string);
  return result !== result ? string : result;
};

Parser.prototype.parseURL = function (string) {
  var data = string.split('/');
  if (data.length !== this.format.length) {
    throw "URI format does not match"
  }
  for (var i = 0; i < data.length; i++) {
    if (this.format[i][0] == ":") {
      var paramName = this.format[i].slice(1);
      this.params[paramName] = this.checkFormat(data[i]);
    } else if (this.format[i] !== data[i]) {
      throw "Unrecognized format, expected "+this.format[i]+" , got "+data[i]
    }
  }
};

Parser.prototype.parseSingleQuery = function (string) {
  var queryPair = string.split('=');
  this.params[queryPair[0]] = this.checkFormat(queryPair[1]);
};

Parser.prototype.parseQuery = function (string) {
  var self = this;
  string.split('&').forEach(function(element){
    self.parseSingleQuery(element)
  });
};

Parser.prototype.parse = function(url) {
  this.params = {};
  var parts = url.slice(1).split("?");
  this.parseURL(parts[0]);
  if (parts.length > 1) {
    this.parseQuery(parts[1]);
  }
  return this.params;
};

exports.Parser = Parser;
var t = new Parser()
t.parse("/6/api/listings/3?sort=desc&limit=10")
console.log(t.params)
