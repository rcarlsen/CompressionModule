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

#import "TiModule.h"

@interface CompressionModule : TiModule 
{
}

- (id)compressFile:(id)file;

@end
