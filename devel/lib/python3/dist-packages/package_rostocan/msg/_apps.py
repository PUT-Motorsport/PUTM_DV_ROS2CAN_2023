# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from package_rostocan/apps.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class apps(genpy.Message):
  _md5sum = "7d6478f1da74e05ce29749e8a7519384"
  _type = "package_rostocan/apps"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint16 pedal_position
uint8 counter
int8 position_diff
"""
  __slots__ = ['pedal_position','counter','position_diff']
  _slot_types = ['uint16','uint8','int8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       pedal_position,counter,position_diff

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(apps, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.pedal_position is None:
        self.pedal_position = 0
      if self.counter is None:
        self.counter = 0
      if self.position_diff is None:
        self.position_diff = 0
    else:
      self.pedal_position = 0
      self.counter = 0
      self.position_diff = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_HBb().pack(_x.pedal_position, _x.counter, _x.position_diff))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 4
      (_x.pedal_position, _x.counter, _x.position_diff,) = _get_struct_HBb().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_HBb().pack(_x.pedal_position, _x.counter, _x.position_diff))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 4
      (_x.pedal_position, _x.counter, _x.position_diff,) = _get_struct_HBb().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_HBb = None
def _get_struct_HBb():
    global _struct_HBb
    if _struct_HBb is None:
        _struct_HBb = struct.Struct("<HBb")
    return _struct_HBb
