// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class apps {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pedal_position = null;
      this.counter = null;
      this.position_diff = null;
    }
    else {
      if (initObj.hasOwnProperty('pedal_position')) {
        this.pedal_position = initObj.pedal_position
      }
      else {
        this.pedal_position = 0;
      }
      if (initObj.hasOwnProperty('counter')) {
        this.counter = initObj.counter
      }
      else {
        this.counter = 0;
      }
      if (initObj.hasOwnProperty('position_diff')) {
        this.position_diff = initObj.position_diff
      }
      else {
        this.position_diff = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type apps
    // Serialize message field [pedal_position]
    bufferOffset = _serializer.uint16(obj.pedal_position, buffer, bufferOffset);
    // Serialize message field [counter]
    bufferOffset = _serializer.uint8(obj.counter, buffer, bufferOffset);
    // Serialize message field [position_diff]
    bufferOffset = _serializer.int8(obj.position_diff, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type apps
    let len;
    let data = new apps(null);
    // Deserialize message field [pedal_position]
    data.pedal_position = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [counter]
    data.counter = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [position_diff]
    data.position_diff = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/apps';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7d6478f1da74e05ce29749e8a7519384';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 pedal_position
    uint8 counter
    int8 position_diff
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new apps(null);
    if (msg.pedal_position !== undefined) {
      resolved.pedal_position = msg.pedal_position;
    }
    else {
      resolved.pedal_position = 0
    }

    if (msg.counter !== undefined) {
      resolved.counter = msg.counter;
    }
    else {
      resolved.counter = 0
    }

    if (msg.position_diff !== undefined) {
      resolved.position_diff = msg.position_diff;
    }
    else {
      resolved.position_diff = 0
    }

    return resolved;
    }
};

module.exports = apps;
