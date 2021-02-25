import cv2
import numpy as np
from mss import mss

class VideoCamera(object):
	def __init__(self):
		self.video = cv2.VideoCapture(0)

	def __del__(self):
		self.video.release()

	def get_frame(self):
		success, image = self.video.read()
		ret, jpeg = cv2.imencode('.jpg', image)
		return jpeg.tobytes(), image, jpeg.tobytes()

class ScreenCapture(object):
	def get_frame(self):
		with mss() as sct:
			try:
				monitor = sct.monitors[1]
				sct_img = sct.grab(monitor)
				image = np.array(sct_img)[:,:,:3]
				resized = cv2.resize(image, (1920,1080))
				ret, jpeg = cv2.imencode('.jpg', image)
				ret, resized_jpeg = cv2.imencode('.jpg', resized)
				return jpeg.tobytes(), image, resized_jpeg.tobytes()
			except:
				pass
