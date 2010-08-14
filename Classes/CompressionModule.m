/**
 * 
 * CompressionModule
 * Copyright (C) 2010 Robert Carlsen
 *
 * This file is part of CompressionModule. 
 * Titanium Appcelerator module wrapper for ZipArchive.
 * Initially created for use with Mobile Logger
 *
 * CompressionModule is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 *
 * ZipArchive is listed as being released under the MIT License
 * http://code.google.com/p/ziparchive/
 *
 */

#import "CompressionModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import "ZipArchive.h"

@implementation CompressionModule

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)exampleProp:(id)value
{
	// example property setter
}

- (id)compressFile:(id)args // assumed to be an NSString
{
    // arg1 should be an NSString (with int)
    id filePath = [args objectAtIndex:0];
    ENSURE_STRING(filePath);
    
    BOOL isDir=NO;
    NSString *exportPath = filePath;
    NSString *fileName = [[exportPath pathComponents] lastObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // Only add it if it's not a directory. ZipArchive will take care of those.
    if ([fileManager fileExistsAtPath:exportPath isDirectory:&isDir] && !isDir){
        TiFile *tempFile = [TiUtils createTempFile:@"zip"];
        NSString *tempPath = [[[tempFile.path pathComponents] objectsAtIndexes:
                              [NSIndexSet indexSetWithIndexesInRange:
                               NSMakeRange(0, [[tempFile.path pathComponents] count]-1)]] componentsJoinedByString:@"/"];

        // this is the export zip.
        NSString *archivePath = [tempPath stringByAppendingPathComponent:
                                 [fileName stringByAppendingPathExtension:@"zip"]]; 

        ZipArchive *archiver = [[ZipArchive alloc] init];
        [archiver CreateZipFile2:archivePath];
        [archiver addFileToZip:exportPath newname:fileName];
        BOOL successCompressing = [archiver CloseZipFile2];
        RELEASE_TO_NIL(archiver);
        
        if(successCompressing) {
            return archivePath;
        }
    }
    return nil;
}

@end
