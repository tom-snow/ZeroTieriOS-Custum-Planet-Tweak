#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define LOG(fmt, ...) NSLog(@"[ZeroTieriOSFix] " fmt "\n", ##__VA_ARGS__)

// The code below should be replaced with your own planet server data
#define ZT_DEFAULT_WORLD_LENGTH 551
static unsigned char ZT_DEFAULT_WORLD[ZT_DEFAULT_WORLD_LENGTH];
static int ZT_PLANET_LOAD = -1;

void initializeZTDefaultWorld() {
	memset(ZT_DEFAULT_WORLD, 0, ZT_DEFAULT_WORLD_LENGTH);

	// 应用容器 Documents 目录
	NSString* document_planet_file = [NSString stringWithFormat:@"%@/Documents/planet", NSHomeDirectory()];
	// ipa 安装包的 .app 目录
	NSString* bundle_planet_file = [[NSBundle mainBundle] pathForResource:@"planet" ofType:nil];
	// 系统 /var/mobile/Documents 目录下
	NSString* system_planet_file = @"/var/mobile/Documents/planet";

	// 如果 Documents 目录下存在 planet 文件, 则读取其内容存到 ZT_DEFAULT_WORLD 中
	if ([[NSFileManager defaultManager] fileExistsAtPath:document_planet_file]) {
		NSData *data = [NSData dataWithContentsOfFile:document_planet_file];
		if (data && data.length <= ZT_DEFAULT_WORLD_LENGTH) {
			ZT_PLANET_LOAD = 1;
			[data getBytes:ZT_DEFAULT_WORLD length:data.length];
		}
	} // 如果 .app 目录下存在 planet 文件, 则读取其内容存到 ZT_DEFAULT_WORLD 中
	else if ([[NSFileManager defaultManager] fileExistsAtPath:bundle_planet_file]) {
		NSData *data = [NSData dataWithContentsOfFile:bundle_planet_file];
		if (data && data.length <= ZT_DEFAULT_WORLD_LENGTH) {
			ZT_PLANET_LOAD = 2;
			[data getBytes:ZT_DEFAULT_WORLD length:data.length];
		}
	} // 如果 /var/mobile/Documents 目录下存在 planet 文件, 则读取其内容存到 ZT_DEFAULT_WORLD 中
	else if ([[NSFileManager defaultManager] fileExistsAtPath:system_planet_file]) {
		NSData *data = [NSData dataWithContentsOfFile:system_planet_file];
		if (data && data.length <= ZT_DEFAULT_WORLD_LENGTH) {
			ZT_PLANET_LOAD = 3;
			[data getBytes:ZT_DEFAULT_WORLD length:data.length];
		}
	}
	else {
		ZT_PLANET_LOAD = 4;
		unsigned char default_world[] = {0x01,0x00,0x00,0x00,0x00,0x08,0xea,0xc9,0x0a,0x00,0x00,0x01,0x6c,0xe3,0xe2,0x39,0x55,0xe0,0x4a,0x55,0x8b,0x9b,0x9e,0x10,0x24,0xd1,0xcf,0xe1,0x93,0x67,0xbf,0x57,0x46,0x97,0x17,0xf5,0x03,0xf6,0x56,0xd1,0x7d,0xb2,0x56,0xe3,0xa5,0x1e,0x07,0x83,0x09,0x7c,0xa1,0x42,0x23,0x13,0xf4,0x81,0xbf,0xdb,0x3a,0xba,0xed,0xad,0xeb,0xa0,0xbd,0x44,0xfb,0x53,0xd9,0xce,0xee,0x08,0x84,0xc9,0x1b,0xf0,0xad,0x1e,0x5a,0xf7,0xf3,0xb6,0x87,0x62,0xd6,0x95,0x4e,0x68,0x34,0xa7,0x8f,0xbf,0x61,0xd4,0xae,0x17,0x51,0x05,0xdc,0x78,0xa8,0x89,0x30,0xe3,0x28,0xf6,0x08,0x40,0x76,0xd4,0x83,0xc9,0x63,0xfa,0x2a,0x13,0x5a,0xdc,0x87,0x96,0xe1,0x0d,0xef,0x35,0xf2,0xa6,0x19,0x08,0x15,0xfd,0xd7,0x1a,0xf0,0xcd,0xb0,0x64,0x5f,0x32,0x17,0x82,0xa3,0xf9,0xf2,0x3a,0x07,0xc8,0x89,0xb8,0x39,0x54,0xba,0x64,0x12,0xa4,0x53,0xae,0x8d,0x3a,0x46,0xb9,0xc8,0x84,0x79,0x5d,0x46,0x7a,0xfe,0xfb,0x08,0x0a,0x41,0x4c,0xe6,0xb9,0xbc,0xe8,0xa3,0x04,0x65,0x37,0x9f,0xf8,0x8e,0x00,0x16,0x1c,0xd8,0x39,0x65,0xf0,0x56,0xb2,0xa1,0xb8,0x24,0x9b,0xd9,0x2a,0x7b,0x6c,0xb9,0x7b,0x8d,0xcc,0x97,0x80,0x8b,0x0d,0xf1,0x11,0x5f,0x4a,0xf8,0x5f,0x45,0x47,0x4c,0xbd,0xc4,0x35,0x3f,0x77,0xc4,0xf0,0x33,0x95,0x55,0x96,0xb3,0x0a,0x59,0x6f,0xc4,0x93,0xef,0xdb,0x81,0x66,0x76,0x22,0xb4,0x58,0xdd,0xf8,0xc3,0x61,0xc0,0x28,0x00,0x01,0x04,0x77,0x1d,0x64,0x25,0x27,0x09,0x3a,0x46,0xf1,0xbf,0x30,0x00,0x76,0xe6,0x6f,0xab,0x33,0xe2,0x85,0x49,0xa6,0x2e,0xe2,0x06,0x4d,0x18,0x43,0x27,0x3c,0x2c,0x30,0x0b,0xa4,0x5c,0x3f,0x20,0xbe,0xf0,0x2d,0xba,0xd2,0x25,0x72,0x3b,0xb5,0x9a,0x9b,0xb4,0xb1,0x35,0x35,0x73,0x09,0x61,0xae,0xec,0xf5,0xa1,0x63,0xac,0xe4,0x77,0xcc,0xeb,0x07,0x27,0x02,0x5b,0x99,0xac,0x14,0xa5,0x16,0x6a,0x09,0xa3,0x00,0x02,0x04,0xb9,0xb4,0x0d,0x52,0x27,0x09,0x06,0x2a,0x02,0x6e,0xa0,0xc8,0x15,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x27,0x09,0xde,0x89,0x50,0xa8,0xb2,0x00,0x1b,0x3a,0xda,0x82,0x51,0xb9,0x1b,0x6b,0x6f,0xa6,0x53,0x5b,0x8c,0x7e,0x24,0x60,0x91,0x8f,0x4f,0x72,0x9a,0xbd,0xec,0x97,0xd3,0xc7,0xf3,0x79,0x68,0x68,0xfb,0x02,0xf0,0xde,0x0b,0x0e,0xe5,0x54,0xb2,0xd5,0x9f,0xc3,0x52,0x47,0x43,0xee,0xbf,0xcf,0x53,0x15,0xe7,0x90,0xed,0x6d,0x92,0xdb,0x5b,0xd1,0x0c,0x28,0xc0,0x9b,0x40,0xef,0x00,0x02,0x04,0xcf,0xf6,0x49,0xf5,0x01,0xbb,0x06,0x20,0x01,0x19,0xf0,0x90,0x02,0x05,0xcb,0x0e,0xc4,0x7a,0xff,0xfe,0x8f,0x69,0xd9,0x01,0xbb,0x34,0xe0,0xa5,0xe1,0x74,0x00,0x93,0xef,0xb5,0x09,0x34,0x78,0x8f,0x85,0x6d,0x5c,0xfb,0x9c,0xa5,0xbe,0x88,0xe8,0x5b,0x40,0x96,0x55,0x86,0xb7,0x5b,0xef,0xac,0x90,0x0d,0xf7,0x73,0x52,0xc1,0x45,0xa1,0xba,0x70,0x07,0x56,0x9d,0x37,0xc7,0x7b,0xfe,0x52,0xc0,0x99,0x9f,0x3b,0xdc,0x67,0xa4,0x7a,0x4a,0x60,0x00,0xb7,0x20,0xa8,0x83,0xce,0x47,0xaa,0x2f,0xb7,0xf8,0x00,0x02,0x04,0x93,0x4b,0x5c,0x02,0x01,0xbb,0x06,0x26,0x04,0x13,0x80,0x30,0x00,0x71,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0xbb};
		memcpy(ZT_DEFAULT_WORLD, default_world, sizeof(default_world));
	}
}

%hook ZeroTierDataStore
- (NSData *)getObjectWithName:(NSString *)name {
	LOG(@"Detected Function: getObjectWithName, name: %@", name);
  if ([name isEqualToString:@"planet"]) {
		LOG(@"getObjectWithName Hooked with ZT_PLANET_LOAD: %d", ZT_PLANET_LOAD);
    return [NSData dataWithBytes:ZT_DEFAULT_WORLD length:ZT_DEFAULT_WORLD_LENGTH];
  }

  return %orig;
}
- (BOOL)putObjectWithName:(NSString *)name buffer:(NSData *)buffer secure:(BOOL)secure {
	LOG(@"Detected Function: putObjectWithName, name: %@", name);
  if ([name isEqualToString:@"planet"]) {
		LOG(@"putObjectWithName Hooked with ZT_PLANET_LOAD: %d", ZT_PLANET_LOAD);
    NSData *data = [NSData dataWithBytes:ZT_DEFAULT_WORLD length:ZT_DEFAULT_WORLD_LENGTH];
    return %orig(name, data, secure);
  }

  return %orig;
}
%end

%ctor {
  LOG(@"loaded in %s (%d)", getprogname(), getpid());
	initializeZTDefaultWorld();
	// 弹窗提示用户初始化成功
  dispatch_async(dispatch_get_main_queue(), ^{
    NSString *messageString = [NSString stringWithFormat:@"Tweak initialized successfully! type: %d", ZT_PLANET_LOAD];
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Initialization"
                                                                   message:messageString
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
  });
  %init();
}