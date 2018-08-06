<<<<<<< HEAD
urlAddParameter = (url, param, value) => {
  let hash = {};
  let parser = document.createElement('a');
  parser.href = url;
  let parameters = parser.search.split(/\?|&/);
  for (let i = 0; i < parameters.length; i++) {
    if (!parameters[i])
      continue;
    let ary = parameters[i].split('=');
=======
function URL_add_parameter(url, param, value){
  let hash       = {};
  let parser     = document.createElement('a');
  parser.href    = url;
  let parameters = parser.search.split(/\?|&/);
  for(let i=0; i < parameters.length; i++) {
    if(!parameters[i])
      continue;
    let ary      = parameters[i].split('=');
>>>>>>> User list
    hash[ary[0]] = ary[1];
  }
  hash[param] = value;
  let list = [];
<<<<<<< HEAD
  Object.keys(hash).forEach(key => {
=======
  Object.keys(hash).forEach(function (key) {
>>>>>>> User list
    list.push(key + '=' + hash[key]);
  });
  parser.search = '?' + list.join('&');
  return parser.href;
}
