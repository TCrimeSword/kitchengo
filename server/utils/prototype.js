String.prototype.toSlug = function () {
  let str = this.valueOf();
  return str
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/đ/g, 'd')
    .replace(/Đ/g, 'D')
    .replace(/ /g, '-')
    .replace(/[^\w-]+/g, '');
};

String.prototype.htmlToText = function () {
  let str = this.valueOf();
  return str.replace(/(<([^>]+)>)/gi, '');
};

String.prototype.display = function (length) {
  let str = this.valueOf();
  return str.length > length ? str.slice(0, length) + '...' : str;
};
