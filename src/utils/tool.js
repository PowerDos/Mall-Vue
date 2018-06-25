import crypto from 'crypto';

export const sign = (str) => {
  const md5 = crypto.createHash('md5');
  md5.update(str);
  return md5.digest('hex');
};
