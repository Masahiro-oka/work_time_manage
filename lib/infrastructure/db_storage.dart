import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/*
These words should not be used
"add","all","alter","and","as","autoincrement","between","case","check","collate",
"commit","constraint","create","default","deferrable","delete","distinct","drop",
"else","escape","except","exists","foreign","from","group","having","if","in",
"index","insert","intersect","into","is","isnull","join","limit","not","notnull",
"null","on","or","order","primary","references","select","set","table","then",
"to","transaction","union","unique","update","using","values","when","where"
 */

@immutable
class DbStorage {
  const DbStorage._();
  static const DbStorage _cache = DbStorage._();
  factory DbStorage() => _cache;

  static Database? _database;

  Future<Database> get dataBase async {
    return _database ??= await initializeDb();
  }

  static const String _workTable = 'work_time';
  static const String _atWorkTable = 'at_work_time';
  static const String _leaveWorkTable = 'leave_Work_time';
  static const String _breakTimeTable = 'break_time_table';
  static const String _expenseTable = 'transportation_expenses_table';
  static const String _commentTable = 'comment_table';
  static const String _todoTable = 'todo';

  Future<Database> initializeDb() async {
    _onConfigure(Database db) async {
      await db.execute("PRAGMA foreign_keys = ON");
    }

    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'workTime.db');
    final database = await openDatabase(path,
        version: 1,
        onConfigure: _onConfigure, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $_todoTable'
          '(id TEXT PRIMARY KEY,'
          'date TEXT NOT NULL,'
          'text TEXT NOT NULL,'
          'done INTEGER NOT NULL)');

      await db.execute('CREATE TABLE $_workTable'
          '(workTime_id TEXT PRIMARY KEY, '
          'date TEXT UNIQUE NOT NULL)');

      await db.execute('CREATE TABLE $_atWorkTable'
          '(at_work_id TEXT PRIMARY KEY,'
          'workTime_id TEXT NOT NULL UNIQUE,'
          'atWork TEXT NOT NULL,'
          'FOREIGN KEY (workTime_id) REFERENCES $_workTable (workTime_id) ON DELETE CASCADE)');

      await db.execute('CREATE TABLE $_leaveWorkTable'
          '(leave_work_id TEXT PRIMARY KEY,'
          'workTime_id TEXT NOT NULL UNIQUE,'
          'leaveWork TEXT NOT NULL,'
          'FOREIGN KEY (workTime_id) REFERENCES $_workTable (workTime_id) ON DELETE CASCADE)');

      await db.execute('CREATE TABLE $_breakTimeTable'
          '(break_id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'workTime_id INTEGER NOT NULL UNIQUE,'
          'breakTime INTEGER NOT NULL,'
          'FOREIGN KEY (workTime_id) REFERENCES $_workTable (workTime_id) ON DELETE CASCADE)');

      await db.execute('CREATE TABLE $_expenseTable'
          '(transportation_id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'workTime_id INTEGER NOT NULL UNIQUE,'
          'transportationExpenses INTEGER NOT NULL,'
          'FOREIGN KEY (workTime_id) REFERENCES $_workTable (workTime_id) ON DELETE CASCADE)');

      await db.execute('CREATE TABLE $_commentTable'
          '(comment_id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'workTime_id INTEGER NOT NULL UNIQUE,'
          'comment TEXT NOT NULL,'
          'FOREIGN KEY (workTime_id) REFERENCES $_workTable (workTime_id) ON DELETE CASCADE)');
    });
    return database;
  }
}
