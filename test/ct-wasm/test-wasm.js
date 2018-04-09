'use strict';
const common = require('../common');
const assert = require('assert');
const {readFile} = require('fs');
const {promisify} = require('util');
const readFileAsync = promisify(readFile);

common.crashOnUnhandledRejection();

async function testPubSum() {
  let b = await readFileAsync(__dirname + '/i32.wasm');
  let m = await WebAssembly.instantiate(b, {});
  let s = m.instance.exports.add(1,2);
  assert(s === 3, 'addition is broken');
}

async function testSecSum() {
  let b = await readFileAsync(__dirname + '/s32.wasm');
  try {
    let m = await WebAssembly.instantiate(b, {});
  } catch(_) {
    return;
  }
  assert.fail("Secrets shouldn't compile (yet)")
}


Promise.all([
    testPubSum(),
    testSecSum(),
]).then(common.mustCall());