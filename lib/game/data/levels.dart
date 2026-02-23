import 'dart:math';
import 'package:flow_points/game/models/level.dart';
import 'package:flow_points/game/models/pair.dart';

class LevelsData {
  static final levels = <Level>[
    Level(
      size: 3,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 2), b: Point(2, 0)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(0, 1)),
      ],
      solution: {
        0: [Point(2, 2), Point(1, 2), Point(1, 1), Point(2, 1), Point(2, 0), ],
        1: [Point(1, 0), Point(0, 0), Point(0, 1), ],
      },
    ),
    Level(
      size: 3,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 2), b: Point(1, 1)),
        Pair(colorId: 1, a: Point(0, 1), b: Point(1, 0)),
      ],
      solution: {
        0: [Point(2, 2), Point(1, 2), Point(1, 1), ],
        1: [Point(0, 1), Point(0, 0), Point(1, 0), ],
      },
    ),
    Level(
      size: 3,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 1), b: Point(0, 2)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(0, 1)),
      ],
      solution: {
        0: [Point(2, 1), Point(1, 1), Point(1, 2), Point(0, 2), ],
        1: [Point(1, 0), Point(0, 0), Point(0, 1), ],
      },
    ),
    Level(
      size: 3,
      requireFullFill: true,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 0), b: Point(0, 1)),
        Pair(colorId: 0, a: Point(1, 1), b: Point(0, 2)),
      ],
      solution: {
        1: [Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), ],
        0: [Point(1, 1), Point(2, 1), Point(2, 2), Point(1, 2), Point(0, 2), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 1), b: Point(1, 2)),
        Pair(colorId: 1, a: Point(3, 3), b: Point(1, 3)),
        Pair(colorId: 2, a: Point(1, 0), b: Point(2, 1)),
      ],
      solution: {
        0: [Point(0, 1), Point(1, 1), Point(1, 2), ],
        1: [Point(3, 3), Point(3, 2), Point(2, 2), Point(2, 3), Point(1, 3), ],
        2: [Point(1, 0), Point(2, 0), Point(3, 0), Point(3, 1), Point(2, 1), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 0),
      },
      pairs: [
        Pair(colorId: 1, a: Point(3, 0), b: Point(3, 3)),
        Pair(colorId: 0, a: Point(1, 3), b: Point(0, 2)),
        Pair(colorId: 2, a: Point(1, 2), b: Point(1, 0)),
      ],
      solution: {
        1: [Point(3, 0), Point(3, 1), Point(2, 1), Point(2, 2), Point(3, 2), Point(3, 3), ],
        0: [Point(1, 3), Point(0, 3), Point(0, 2), ],
        2: [Point(1, 2), Point(1, 1), Point(0, 1), Point(0, 0), Point(1, 0), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 2),
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 2), b: Point(3, 2)),
        Pair(colorId: 1, a: Point(2, 0), b: Point(3, 1)),
        Pair(colorId: 2, a: Point(1, 0), b: Point(0, 1)),
      ],
      solution: {
        0: [Point(1, 2), Point(0, 2), Point(0, 3), Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), ],
        1: [Point(2, 0), Point(3, 0), Point(3, 1), ],
        2: [Point(1, 0), Point(1, 1), Point(0, 1), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 1), b: Point(3, 0)),
        Pair(colorId: 1, a: Point(0, 0), b: Point(1, 2)),
        Pair(colorId: 2, a: Point(3, 1), b: Point(2, 2)),
      ],
      solution: {
        0: [Point(1, 1), Point(2, 1), Point(2, 0), Point(3, 0), ],
        1: [Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 2), ],
        2: [Point(3, 1), Point(3, 2), Point(3, 3), Point(2, 3), Point(2, 2), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 3),
      },
      pairs: [
        Pair(colorId: 1, a: Point(3, 1), b: Point(0, 0)),
        Pair(colorId: 0, a: Point(2, 1), b: Point(3, 2)),
        Pair(colorId: 2, a: Point(1, 2), b: Point(0, 3)),
      ],
      solution: {
        1: [Point(3, 1), Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), Point(0, 1), Point(0, 0), ],
        0: [Point(2, 1), Point(2, 2), Point(3, 2), ],
        2: [Point(1, 2), Point(0, 2), Point(0, 3), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 3), b: Point(1, 1)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(3, 2)),
        Pair(colorId: 2, a: Point(1, 2), b: Point(0, 1)),
      ],
      solution: {
        0: [Point(3, 3), Point(2, 3), Point(2, 2), Point(2, 1), Point(1, 1), ],
        1: [Point(1, 0), Point(2, 0), Point(3, 0), Point(3, 1), Point(3, 2), ],
        2: [Point(1, 2), Point(1, 3), Point(0, 3), Point(0, 2), Point(0, 1), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 1),
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 3), b: Point(1, 1)),
        Pair(colorId: 1, a: Point(3, 2), b: Point(1, 2)),
        Pair(colorId: 2, a: Point(3, 1), b: Point(2, 0)),
      ],
      solution: {
        0: [Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(1, 1), ],
        1: [Point(3, 2), Point(2, 2), Point(2, 3), Point(1, 3), Point(1, 2), ],
        2: [Point(3, 1), Point(3, 0), Point(2, 0), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(3, 3), b: Point(1, 1)),
        Pair(colorId: 0, a: Point(0, 0), b: Point(0, 2)),
        Pair(colorId: 1, a: Point(3, 1), b: Point(2, 2)),
      ],
      solution: {
        2: [Point(3, 3), Point(2, 3), Point(1, 3), Point(1, 2), Point(1, 1), ],
        0: [Point(0, 0), Point(0, 1), Point(0, 2), ],
        1: [Point(3, 1), Point(3, 2), Point(2, 2), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 0), b: Point(3, 1)),
        Pair(colorId: 1, a: Point(3, 2), b: Point(2, 3)),
        Pair(colorId: 2, a: Point(0, 2), b: Point(1, 1)),
      ],
      solution: {
        0: [Point(1, 0), Point(2, 0), Point(2, 1), Point(3, 1), ],
        1: [Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), Point(2, 3), ],
        2: [Point(0, 2), Point(0, 1), Point(1, 1), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 3), b: Point(1, 0)),
        Pair(colorId: 1, a: Point(2, 3), b: Point(1, 2)),
        Pair(colorId: 2, a: Point(2, 0), b: Point(2, 2)),
      ],
      solution: {
        0: [Point(0, 3), Point(0, 2), Point(0, 1), Point(1, 1), Point(1, 0), ],
        1: [Point(2, 3), Point(1, 3), Point(1, 2), ],
        2: [Point(2, 0), Point(2, 1), Point(3, 1), Point(3, 2), Point(2, 2), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 1), b: Point(0, 1)),
        Pair(colorId: 1, a: Point(3, 2), b: Point(3, 0)),
        Pair(colorId: 2, a: Point(1, 3), b: Point(0, 2)),
      ],
      solution: {
        0: [Point(2, 1), Point(2, 2), Point(1, 2), Point(1, 1), Point(1, 0), Point(0, 0), Point(0, 1), ],
        1: [Point(3, 2), Point(3, 1), Point(3, 0), ],
        2: [Point(1, 3), Point(0, 3), Point(0, 2), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 3), b: Point(3, 3)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(0, 2)),
        Pair(colorId: 2, a: Point(3, 2), b: Point(2, 1)),
      ],
      solution: {
        0: [Point(0, 3), Point(1, 3), Point(1, 2), Point(2, 2), Point(2, 3), Point(3, 3), ],
        1: [Point(1, 0), Point(1, 1), Point(0, 1), Point(0, 2), ],
        2: [Point(3, 2), Point(3, 1), Point(3, 0), Point(2, 0), Point(2, 1), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 1), b: Point(0, 1)),
        Pair(colorId: 1, a: Point(0, 2), b: Point(1, 1)),
        Pair(colorId: 2, a: Point(3, 3), b: Point(2, 2)),
      ],
      solution: {
        0: [Point(2, 1), Point(3, 1), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), ],
        1: [Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 2), Point(1, 1), ],
        2: [Point(3, 3), Point(2, 3), Point(2, 2), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(1, 3), b: Point(3, 1)),
        Pair(colorId: 0, a: Point(2, 1), b: Point(2, 3)),
        Pair(colorId: 2, a: Point(0, 2), b: Point(0, 0)),
      ],
      solution: {
        1: [Point(1, 3), Point(1, 2), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), Point(3, 1), ],
        0: [Point(2, 1), Point(2, 2), Point(3, 2), Point(3, 3), Point(2, 3), ],
        2: [Point(0, 2), Point(0, 1), Point(0, 0), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(0, 0), b: Point(3, 2)),
        Pair(colorId: 0, a: Point(0, 3), b: Point(3, 3)),
        Pair(colorId: 1, a: Point(0, 2), b: Point(1, 1)),
      ],
      solution: {
        2: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(3, 1), Point(2, 1), Point(2, 2), Point(3, 2), ],
        0: [Point(0, 3), Point(1, 3), Point(2, 3), Point(3, 3), ],
        1: [Point(0, 2), Point(1, 2), Point(1, 1), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(1, 1),
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 3), b: Point(3, 1)),
        Pair(colorId: 0, a: Point(2, 1), b: Point(0, 1)),
        Pair(colorId: 2, a: Point(1, 3), b: Point(3, 3)),
      ],
      solution: {
        1: [Point(0, 3), Point(0, 2), Point(1, 2), Point(2, 2), Point(3, 2), Point(3, 1), ],
        0: [Point(2, 1), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), ],
        2: [Point(1, 3), Point(2, 3), Point(3, 3), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 0), b: Point(3, 2)),
        Pair(colorId: 0, a: Point(0, 2), b: Point(1, 1)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(3, 3)),
      ],
      solution: {
        2: [Point(2, 0), Point(2, 1), Point(3, 1), Point(3, 2), ],
        0: [Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 2), Point(1, 1), ],
        1: [Point(2, 2), Point(2, 3), Point(3, 3), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 0), b: Point(3, 0)),
        Pair(colorId: 2, a: Point(3, 2), b: Point(1, 3)),
        Pair(colorId: 0, a: Point(0, 2), b: Point(2, 2)),
      ],
      solution: {
        1: [Point(0, 0), Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), Point(2, 1), Point(3, 1), Point(3, 0), ],
        2: [Point(3, 2), Point(3, 3), Point(2, 3), Point(1, 3), ],
        0: [Point(0, 2), Point(1, 2), Point(2, 2), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 2), b: Point(2, 0)),
        Pair(colorId: 1, a: Point(2, 1), b: Point(0, 2)),
        Pair(colorId: 2, a: Point(1, 2), b: Point(0, 0)),
      ],
      solution: {
        0: [Point(3, 2), Point(3, 1), Point(3, 0), Point(2, 0), ],
        1: [Point(2, 1), Point(2, 2), Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 2), ],
        2: [Point(1, 2), Point(1, 1), Point(0, 1), Point(0, 0), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 1), b: Point(3, 0)),
        Pair(colorId: 2, a: Point(1, 3), b: Point(3, 2)),
        Pair(colorId: 1, a: Point(1, 1), b: Point(0, 0)),
      ],
      solution: {
        0: [Point(0, 1), Point(0, 2), Point(1, 2), Point(2, 2), Point(2, 1), Point(3, 1), Point(3, 0), ],
        2: [Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), ],
        1: [Point(1, 1), Point(1, 0), Point(0, 0), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(1, 2), b: Point(3, 1)),
        Pair(colorId: 0, a: Point(1, 0), b: Point(2, 1)),
        Pair(colorId: 2, a: Point(0, 2), b: Point(1, 3)),
      ],
      solution: {
        1: [Point(1, 2), Point(2, 2), Point(2, 3), Point(3, 3), Point(3, 2), Point(3, 1), ],
        0: [Point(1, 0), Point(0, 0), Point(0, 1), Point(1, 1), Point(2, 1), ],
        2: [Point(0, 2), Point(0, 3), Point(1, 3), ],
      },
    ),
    Level(
      size: 4,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 2),
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 2), b: Point(2, 0)),
        Pair(colorId: 0, a: Point(2, 1), b: Point(3, 2)),
        Pair(colorId: 1, a: Point(0, 3), b: Point(2, 3)),
      ],
      solution: {
        2: [Point(1, 2), Point(0, 2), Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), ],
        0: [Point(2, 1), Point(3, 1), Point(3, 2), ],
        1: [Point(0, 3), Point(1, 3), Point(2, 3), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(3, 3),
        Point(1, 2),
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 0), b: Point(1, 3)),
        Pair(colorId: 1, a: Point(1, 4), b: Point(0, 2)),
        Pair(colorId: 2, a: Point(3, 2), b: Point(4, 4)),
      ],
      solution: {
        0: [Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(1, 1), Point(2, 1), Point(2, 2), Point(2, 3), Point(1, 3), ],
        1: [Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), ],
        2: [Point(3, 2), Point(3, 1), Point(3, 0), Point(4, 0), Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 1), b: Point(4, 4)),
        Pair(colorId: 1, a: Point(0, 1), b: Point(0, 4)),
        Pair(colorId: 2, a: Point(2, 2), b: Point(3, 4)),
        Pair(colorId: 3, a: Point(2, 1), b: Point(4, 0)),
      ],
      solution: {
        0: [Point(3, 1), Point(4, 1), Point(4, 2), Point(3, 2), Point(3, 3), Point(4, 3), Point(4, 4), ],
        1: [Point(0, 1), Point(1, 1), Point(1, 2), Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 4), Point(0, 4), ],
        2: [Point(2, 2), Point(2, 3), Point(2, 4), Point(3, 4), ],
        3: [Point(2, 1), Point(2, 0), Point(3, 0), Point(4, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(4, 2),
        Point(2, 2),
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 3), b: Point(3, 0)),
        Pair(colorId: 1, a: Point(1, 3), b: Point(4, 1)),
        Pair(colorId: 2, a: Point(4, 3), b: Point(2, 4)),
      ],
      solution: {
        0: [Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(1, 1), Point(2, 1), Point(2, 0), Point(3, 0), ],
        1: [Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), Point(3, 1), Point(4, 1), ],
        2: [Point(4, 3), Point(4, 4), Point(3, 4), Point(2, 4), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 2),
        Point(0, 2),
        Point(1, 4),
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 1), b: Point(4, 3)),
        Pair(colorId: 0, a: Point(2, 4), b: Point(3, 2)),
        Pair(colorId: 2, a: Point(1, 1), b: Point(0, 3)),
      ],
      solution: {
        1: [Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), Point(2, 1), Point(3, 1), Point(3, 0), Point(4, 0), Point(4, 1), Point(4, 2), Point(4, 3), ],
        0: [Point(2, 4), Point(2, 3), Point(3, 3), Point(3, 2), ],
        2: [Point(1, 1), Point(1, 2), Point(1, 3), Point(0, 3), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 1), b: Point(4, 4)),
        Pair(colorId: 2, a: Point(0, 0), b: Point(3, 2)),
        Pair(colorId: 0, a: Point(0, 2), b: Point(1, 4)),
      ],
      solution: {
        1: [Point(0, 1), Point(1, 1), Point(1, 2), Point(1, 3), Point(2, 3), Point(2, 4), Point(3, 4), Point(3, 3), Point(4, 3), Point(4, 4), ],
        2: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), Point(3, 1), Point(2, 1), Point(2, 2), Point(3, 2), ],
        0: [Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(0, 4), b: Point(4, 0)),
        Pair(colorId: 1, a: Point(0, 2), b: Point(2, 0)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(4, 2)),
      ],
      solution: {
        2: [Point(0, 4), Point(0, 3), Point(1, 3), Point(1, 4), Point(2, 4), Point(2, 3), Point(3, 3), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 1), Point(2, 1), Point(3, 1), Point(3, 0), Point(4, 0), ],
        1: [Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), ],
        0: [Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(0, 1),
        Point(2, 2),
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 3), b: Point(3, 3)),
        Pair(colorId: 1, a: Point(4, 0), b: Point(2, 1)),
        Pair(colorId: 2, a: Point(3, 1), b: Point(3, 4)),
      ],
      solution: {
        0: [Point(0, 3), Point(1, 3), Point(1, 4), Point(2, 4), Point(2, 3), Point(3, 3), ],
        1: [Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), Point(2, 1), ],
        2: [Point(3, 1), Point(3, 2), Point(4, 2), Point(4, 3), Point(4, 4), Point(3, 4), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 1), b: Point(4, 1)),
        Pair(colorId: 0, a: Point(1, 2), b: Point(2, 0)),
        Pair(colorId: 2, a: Point(2, 1), b: Point(4, 0)),
      ],
      solution: {
        1: [Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), Point(3, 3), Point(3, 2), Point(4, 2), Point(4, 1), ],
        0: [Point(1, 2), Point(1, 1), Point(1, 0), Point(2, 0), ],
        2: [Point(2, 1), Point(3, 1), Point(3, 0), Point(4, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 0),
        Point(1, 3),
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 1), b: Point(4, 2)),
        Pair(colorId: 0, a: Point(2, 4), b: Point(0, 3)),
        Pair(colorId: 1, a: Point(3, 2), b: Point(4, 0)),
      ],
      solution: {
        2: [Point(1, 1), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(1, 2), Point(2, 2), Point(2, 3), Point(3, 3), Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
        0: [Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), ],
        1: [Point(3, 2), Point(3, 1), Point(4, 1), Point(4, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(3, 4),
        Point(1, 1),
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 0), b: Point(0, 3)),
        Pair(colorId: 1, a: Point(4, 1), b: Point(2, 2)),
        Pair(colorId: 2, a: Point(3, 3), b: Point(1, 4)),
      ],
      solution: {
        0: [Point(0, 0), Point(0, 1), Point(0, 2), Point(1, 2), Point(1, 3), Point(0, 3), ],
        1: [Point(4, 1), Point(4, 2), Point(3, 2), Point(3, 1), Point(2, 1), Point(2, 2), ],
        2: [Point(3, 3), Point(2, 3), Point(2, 4), Point(1, 4), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 2), b: Point(2, 4)),
        Pair(colorId: 0, a: Point(3, 1), b: Point(1, 0)),
        Pair(colorId: 1, a: Point(1, 1), b: Point(3, 2)),
      ],
      solution: {
        2: [Point(4, 2), Point(4, 3), Point(4, 4), Point(3, 4), Point(3, 3), Point(2, 3), Point(1, 3), Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(2, 4), ],
        0: [Point(3, 1), Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), ],
        1: [Point(1, 1), Point(2, 1), Point(2, 2), Point(3, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(1, 1),
        Point(3, 0),
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 2), b: Point(4, 0)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(0, 0)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(4, 2)),
      ],
      solution: {
        2: [Point(1, 2), Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 4), Point(2, 4), Point(2, 3), Point(3, 3), Point(3, 2), Point(3, 1), Point(4, 1), Point(4, 0), ],
        1: [Point(2, 2), Point(2, 1), Point(2, 0), Point(1, 0), Point(0, 0), ],
        0: [Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 4),
        Point(2, 1),
      },
      pairs: [
        Pair(colorId: 2, a: Point(0, 4), b: Point(3, 1)),
        Pair(colorId: 0, a: Point(0, 3), b: Point(2, 2)),
        Pair(colorId: 1, a: Point(0, 1), b: Point(2, 0)),
      ],
      solution: {
        2: [Point(0, 4), Point(1, 4), Point(1, 3), Point(2, 3), Point(3, 3), Point(4, 3), Point(4, 2), Point(4, 1), Point(3, 1), ],
        0: [Point(0, 3), Point(0, 2), Point(1, 2), Point(2, 2), ],
        1: [Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 4),
        Point(3, 1),
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 2), b: Point(4, 4)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(0, 3)),
        Pair(colorId: 0, a: Point(4, 1), b: Point(2, 0)),
      ],
      solution: {
        2: [Point(1, 2), Point(1, 3), Point(2, 3), Point(2, 2), Point(3, 2), Point(4, 2), Point(4, 3), Point(3, 3), Point(3, 4), Point(4, 4), ],
        1: [Point(1, 0), Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), ],
        0: [Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(3, 2), b: Point(1, 4)),
        Pair(colorId: 0, a: Point(0, 1), b: Point(2, 0)),
        Pair(colorId: 2, a: Point(1, 2), b: Point(0, 4)),
      ],
      solution: {
        1: [Point(3, 2), Point(3, 3), Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), Point(4, 1), Point(4, 0), Point(3, 0), Point(3, 1), Point(2, 1), Point(2, 2), Point(2, 3), Point(1, 3), Point(1, 4), ],
        0: [Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), ],
        2: [Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(3, 3),
        Point(3, 0),
      },
      pairs: [
        Pair(colorId: 1, a: Point(4, 0), b: Point(1, 3)),
        Pair(colorId: 2, a: Point(2, 1), b: Point(0, 3)),
        Pair(colorId: 0, a: Point(2, 4), b: Point(4, 3)),
      ],
      solution: {
        1: [Point(4, 0), Point(4, 1), Point(3, 1), Point(3, 2), Point(2, 2), Point(2, 3), Point(1, 3), ],
        2: [Point(2, 1), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(1, 1), Point(1, 2), Point(0, 2), Point(0, 3), ],
        0: [Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 0),
        Point(0, 3),
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 2), b: Point(4, 1)),
        Pair(colorId: 0, a: Point(2, 4), b: Point(1, 2)),
        Pair(colorId: 2, a: Point(2, 3), b: Point(4, 2)),
      ],
      solution: {
        1: [Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(1, 1), Point(2, 1), Point(2, 2), Point(3, 2), Point(3, 1), Point(3, 0), Point(4, 0), Point(4, 1), ],
        0: [Point(2, 4), Point(1, 4), Point(1, 3), Point(1, 2), ],
        2: [Point(2, 3), Point(3, 3), Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: true,
      blocked: <Point<int>>{
        Point(2, 0),
        Point(4, 2),
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 4), b: Point(3, 0)),
        Pair(colorId: 1, a: Point(1, 2), b: Point(2, 4)),
        Pair(colorId: 2, a: Point(0, 1), b: Point(2, 2)),
      ],
      solution: {
        0: [Point(3, 4), Point(4, 4), Point(4, 3), Point(3, 3), Point(3, 2), Point(3, 1), Point(4, 1), Point(4, 0), Point(3, 0), ],
        1: [Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(1, 3), Point(2, 3), Point(2, 4), ],
        2: [Point(0, 1), Point(0, 0), Point(1, 0), Point(1, 1), Point(2, 1), Point(2, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(1, 1), b: Point(3, 3)),
        Pair(colorId: 2, a: Point(1, 0), b: Point(1, 4)),
        Pair(colorId: 0, a: Point(2, 0), b: Point(3, 2)),
      ],
      solution: {
        1: [Point(1, 1), Point(2, 1), Point(2, 2), Point(1, 2), Point(1, 3), Point(2, 3), Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), Point(3, 3), ],
        2: [Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), ],
        0: [Point(2, 0), Point(3, 0), Point(3, 1), Point(4, 1), Point(4, 2), Point(3, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 2), b: Point(3, 0)),
        Pair(colorId: 1, a: Point(1, 3), b: Point(3, 4)),
        Pair(colorId: 2, a: Point(0, 0), b: Point(0, 3)),
      ],
      solution: {
        0: [Point(2, 2), Point(2, 3), Point(3, 3), Point(4, 3), Point(4, 2), Point(4, 1), Point(4, 0), Point(3, 0), ],
        1: [Point(1, 3), Point(1, 4), Point(2, 4), Point(3, 4), ],
        2: [Point(0, 0), Point(1, 0), Point(2, 0), Point(2, 1), Point(1, 1), Point(1, 2), Point(0, 2), Point(0, 3), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(3, 3),
        Point(1, 2),
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 0), b: Point(2, 3)),
        Pair(colorId: 1, a: Point(0, 2), b: Point(3, 4)),
        Pair(colorId: 2, a: Point(4, 4), b: Point(3, 2)),
      ],
      solution: {
        0: [Point(0, 0), Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), Point(3, 1), Point(2, 1), Point(2, 2), Point(2, 3), ],
        1: [Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 4), Point(2, 4), Point(3, 4), ],
        2: [Point(4, 4), Point(4, 3), Point(4, 2), Point(3, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(0, 1),
        Point(3, 1),
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 4), b: Point(2, 1)),
        Pair(colorId: 1, a: Point(2, 3), b: Point(4, 4)),
        Pair(colorId: 2, a: Point(3, 2), b: Point(4, 0)),
      ],
      solution: {
        0: [Point(1, 4), Point(0, 4), Point(0, 3), Point(1, 3), Point(1, 2), Point(2, 2), Point(2, 1), ],
        1: [Point(2, 3), Point(2, 4), Point(3, 4), Point(3, 3), Point(4, 3), Point(4, 4), ],
        2: [Point(3, 2), Point(4, 2), Point(4, 1), Point(4, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 0), b: Point(2, 2)),
        Pair(colorId: 1, a: Point(1, 1), b: Point(2, 3)),
        Pair(colorId: 2, a: Point(4, 4), b: Point(1, 4)),
      ],
      solution: {
        0: [Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), Point(4, 2), Point(4, 3), Point(3, 3), Point(3, 2), Point(3, 1), Point(2, 1), Point(2, 2), ],
        1: [Point(1, 1), Point(0, 1), Point(0, 2), Point(1, 2), Point(1, 3), Point(2, 3), ],
        2: [Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(4, 2),
        Point(1, 2),
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 4), b: Point(3, 2)),
        Pair(colorId: 2, a: Point(1, 1), b: Point(0, 4)),
        Pair(colorId: 1, a: Point(4, 1), b: Point(2, 0)),
      ],
      solution: {
        0: [Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 2), Point(2, 1), Point(3, 1), Point(3, 2), ],
        2: [Point(1, 1), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), ],
        1: [Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(3, 4), b: Point(0, 0)),
        Pair(colorId: 3, a: Point(0, 1), b: Point(1, 4)),
        Pair(colorId: 0, a: Point(3, 1), b: Point(4, 3)),
        Pair(colorId: 1, a: Point(3, 0), b: Point(4, 2)),
      ],
      solution: {
        2: [Point(3, 4), Point(2, 4), Point(2, 3), Point(1, 3), Point(1, 2), Point(2, 2), Point(2, 1), Point(1, 1), Point(1, 0), Point(0, 0), ],
        3: [Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), ],
        0: [Point(3, 1), Point(3, 2), Point(3, 3), Point(4, 3), ],
        1: [Point(3, 0), Point(4, 0), Point(4, 1), Point(4, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 0), b: Point(4, 1)),
        Pair(colorId: 1, a: Point(1, 1), b: Point(4, 3)),
        Pair(colorId: 2, a: Point(2, 4), b: Point(0, 2)),
      ],
      solution: {
        0: [Point(0, 0), Point(1, 0), Point(2, 0), Point(2, 1), Point(3, 1), Point(3, 2), Point(4, 2), Point(4, 1), ],
        1: [Point(1, 1), Point(1, 2), Point(2, 2), Point(2, 3), Point(3, 3), Point(3, 4), Point(4, 4), Point(4, 3), ],
        2: [Point(2, 4), Point(1, 4), Point(1, 3), Point(0, 3), Point(0, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(3, 4),
        Point(0, 1),
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 3), b: Point(1, 0)),
        Pair(colorId: 0, a: Point(2, 0), b: Point(4, 1)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(0, 3)),
      ],
      solution: {
        2: [Point(2, 3), Point(3, 3), Point(4, 3), Point(4, 2), Point(3, 2), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 0), ],
        0: [Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), ],
        1: [Point(2, 2), Point(1, 2), Point(1, 3), Point(1, 4), Point(0, 4), Point(0, 3), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 3), b: Point(0, 0)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(4, 4)),
        Pair(colorId: 0, a: Point(0, 2), b: Point(1, 4)),
      ],
      solution: {
        2: [Point(4, 3), Point(3, 3), Point(3, 2), Point(4, 2), Point(4, 1), Point(4, 0), Point(3, 0), Point(3, 1), Point(2, 1), Point(2, 0), Point(1, 0), Point(0, 0), ],
        1: [Point(2, 2), Point(1, 2), Point(1, 3), Point(2, 3), Point(2, 4), Point(3, 4), Point(4, 4), ],
        0: [Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(3, 3),
        Point(1, 4),
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 1), b: Point(0, 1)),
        Pair(colorId: 1, a: Point(1, 2), b: Point(2, 4)),
        Pair(colorId: 2, a: Point(3, 4), b: Point(2, 2)),
      ],
      solution: {
        0: [Point(3, 1), Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), Point(2, 1), Point(1, 1), Point(1, 0), Point(0, 0), Point(0, 1), ],
        1: [Point(1, 2), Point(0, 2), Point(0, 3), Point(1, 3), Point(2, 3), Point(2, 4), ],
        2: [Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), Point(3, 2), Point(2, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(4, 3),
        Point(1, 2),
      },
      pairs: [
        Pair(colorId: 1, a: Point(3, 1), b: Point(4, 4)),
        Pair(colorId: 0, a: Point(4, 1), b: Point(2, 0)),
        Pair(colorId: 2, a: Point(0, 2), b: Point(1, 0)),
      ],
      solution: {
        1: [Point(3, 1), Point(3, 2), Point(2, 2), Point(2, 3), Point(1, 3), Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), ],
        0: [Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), ],
        2: [Point(0, 2), Point(0, 1), Point(1, 1), Point(1, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(1, 3),
        Point(4, 1),
        Point(1, 0),
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 4), b: Point(0, 0)),
        Pair(colorId: 1, a: Point(1, 2), b: Point(2, 4)),
        Pair(colorId: 2, a: Point(4, 4), b: Point(3, 2)),
      ],
      solution: {
        0: [Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        1: [Point(1, 2), Point(1, 1), Point(2, 1), Point(2, 2), Point(2, 3), Point(3, 3), Point(3, 4), Point(2, 4), ],
        2: [Point(4, 4), Point(4, 3), Point(4, 2), Point(3, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 0), b: Point(0, 3)),
        Pair(colorId: 0, a: Point(0, 4), b: Point(4, 4)),
        Pair(colorId: 1, a: Point(4, 0), b: Point(4, 3)),
      ],
      solution: {
        2: [Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(1, 2), Point(1, 1), Point(2, 1), Point(3, 1), Point(3, 2), Point(2, 2), Point(2, 3), Point(1, 3), Point(0, 3), ],
        0: [Point(0, 4), Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), ],
        1: [Point(4, 0), Point(4, 1), Point(4, 2), Point(4, 3), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(1, 2),
        Point(2, 4),
      },
      pairs: [
        Pair(colorId: 0, a: Point(4, 1), b: Point(3, 3)),
        Pair(colorId: 1, a: Point(2, 1), b: Point(1, 3)),
        Pair(colorId: 2, a: Point(2, 3), b: Point(3, 1)),
      ],
      solution: {
        0: [Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), Point(3, 4), Point(3, 3), ],
        1: [Point(2, 1), Point(1, 1), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(1, 3), ],
        2: [Point(2, 3), Point(2, 2), Point(3, 2), Point(3, 1), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(1, 2),
        Point(4, 2),
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 3), b: Point(2, 1)),
        Pair(colorId: 0, a: Point(0, 1), b: Point(1, 3)),
        Pair(colorId: 1, a: Point(0, 0), b: Point(3, 0)),
      ],
      solution: {
        2: [Point(4, 3), Point(4, 4), Point(3, 4), Point(2, 4), Point(2, 3), Point(3, 3), Point(3, 2), Point(2, 2), Point(2, 1), ],
        0: [Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(1, 3), ],
        1: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(3, 0),
        Point(2, 1),
      },
      pairs: [
        Pair(colorId: 0, a: Point(4, 2), b: Point(2, 4)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(0, 3)),
        Pair(colorId: 2, a: Point(0, 4), b: Point(2, 3)),
      ],
      solution: {
        0: [Point(4, 2), Point(4, 1), Point(3, 1), Point(3, 2), Point(3, 3), Point(4, 3), Point(4, 4), Point(3, 4), Point(2, 4), ],
        1: [Point(2, 2), Point(1, 2), Point(1, 1), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), ],
        2: [Point(0, 4), Point(1, 4), Point(1, 3), Point(2, 3), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 4), b: Point(1, 1)),
        Pair(colorId: 1, a: Point(2, 0), b: Point(0, 1)),
        Pair(colorId: 2, a: Point(4, 1), b: Point(3, 3)),
      ],
      solution: {
        0: [Point(3, 4), Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), Point(1, 2), Point(2, 2), Point(2, 1), Point(1, 1), ],
        1: [Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), ],
        2: [Point(4, 1), Point(4, 0), Point(3, 0), Point(3, 1), Point(3, 2), Point(4, 2), Point(4, 3), Point(3, 3), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(3, 3),
        Point(1, 3),
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 4), b: Point(2, 1)),
        Pair(colorId: 0, a: Point(2, 2), b: Point(4, 3)),
        Pair(colorId: 1, a: Point(3, 1), b: Point(1, 0)),
      ],
      solution: {
        2: [Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), Point(1, 2), Point(1, 1), Point(2, 1), ],
        0: [Point(2, 2), Point(3, 2), Point(4, 2), Point(4, 3), ],
        1: [Point(3, 1), Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(0, 3),
        Point(3, 1),
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 1), b: Point(1, 2)),
        Pair(colorId: 0, a: Point(4, 2), b: Point(2, 3)),
        Pair(colorId: 1, a: Point(4, 3), b: Point(2, 4)),
        Pair(colorId: 3, a: Point(1, 0), b: Point(0, 2)),
      ],
      solution: {
        2: [Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), Point(2, 1), Point(1, 1), Point(1, 2), ],
        0: [Point(4, 2), Point(3, 2), Point(3, 3), Point(2, 3), ],
        1: [Point(4, 3), Point(4, 4), Point(3, 4), Point(2, 4), ],
        3: [Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(2, 3),
        Point(1, 1),
        Point(4, 2),
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 2), b: Point(2, 0)),
        Pair(colorId: 1, a: Point(4, 4), b: Point(3, 1)),
        Pair(colorId: 2, a: Point(0, 4), b: Point(2, 2)),
      ],
      solution: {
        0: [Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), ],
        1: [Point(4, 4), Point(4, 3), Point(3, 3), Point(3, 2), Point(3, 1), ],
        2: [Point(0, 4), Point(0, 3), Point(1, 3), Point(1, 2), Point(2, 2), ],
      },
    ),
    Level(
      size: 5,
      requireFullFill: false,
      blocked: <Point<int>>{
        Point(0, 1),
        Point(3, 2),
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 2), b: Point(4, 4)),
        Pair(colorId: 1, a: Point(0, 0), b: Point(2, 2)),
        Pair(colorId: 0, a: Point(4, 3), b: Point(4, 0)),
      ],
      solution: {
        2: [Point(1, 2), Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 4), Point(2, 4), Point(2, 3), Point(3, 3), Point(3, 4), Point(4, 4), ],
        1: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(3, 1), Point(2, 1), Point(2, 2), ],
        0: [Point(4, 3), Point(4, 2), Point(4, 1), Point(4, 0), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 2), b: Point(0, 5)),
        Pair(colorId: 2, a: Point(1, 1), b: Point(0, 4)),
        Pair(colorId: 1, a: Point(0, 0), b: Point(2, 1)),
        Pair(colorId: 3, a: Point(4, 4), b: Point(2, 5)),
      ],
      solution: {
        0: [Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), Point(0, 5), ],
        2: [Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), ],
        1: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(4, 3), Point(4, 2), Point(4, 1), Point(3, 1), Point(2, 1), ],
        3: [Point(4, 4), Point(3, 4), Point(2, 4), Point(2, 5), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 2), b: Point(5, 4)),
        Pair(colorId: 0, a: Point(0, 0), b: Point(1, 3)),
        Pair(colorId: 1, a: Point(4, 2), b: Point(3, 5)),
        Pair(colorId: 3, a: Point(2, 2), b: Point(3, 4)),
      ],
      solution: {
        2: [Point(1, 2), Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), ],
        0: [Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(1, 3), ],
        1: [Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), Point(3, 5), ],
        3: [Point(2, 2), Point(3, 2), Point(3, 3), Point(3, 4), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(0, 0), b: Point(5, 2)),
        Pair(colorId: 0, a: Point(1, 0), b: Point(4, 1)),
        Pair(colorId: 1, a: Point(3, 3), b: Point(2, 5)),
        Pair(colorId: 3, a: Point(1, 5), b: Point(0, 3)),
      ],
      solution: {
        2: [Point(0, 0), Point(0, 1), Point(1, 1), Point(2, 1), Point(3, 1), Point(3, 2), Point(4, 2), Point(5, 2), ],
        0: [Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), ],
        1: [Point(3, 3), Point(2, 3), Point(2, 4), Point(2, 5), ],
        3: [Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(3, 0), b: Point(3, 4)),
        Pair(colorId: 0, a: Point(5, 4), b: Point(3, 5)),
        Pair(colorId: 1, a: Point(5, 3), b: Point(3, 2)),
        Pair(colorId: 2, a: Point(4, 0), b: Point(5, 2)),
      ],
      solution: {
        3: [Point(3, 0), Point(2, 0), Point(2, 1), Point(2, 2), Point(2, 3), Point(3, 3), Point(3, 4), ],
        0: [Point(5, 4), Point(4, 4), Point(4, 5), Point(3, 5), ],
        1: [Point(5, 3), Point(4, 3), Point(4, 2), Point(3, 2), ],
        2: [Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 3), b: Point(5, 1)),
        Pair(colorId: 1, a: Point(4, 4), b: Point(3, 1)),
        Pair(colorId: 3, a: Point(4, 5), b: Point(0, 5)),
        Pair(colorId: 0, a: Point(1, 2), b: Point(4, 2)),
      ],
      solution: {
        2: [Point(2, 3), Point(3, 3), Point(4, 3), Point(5, 3), Point(5, 2), Point(5, 1), ],
        1: [Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(1, 1), Point(2, 1), Point(3, 1), ],
        3: [Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), ],
        0: [Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 1), b: Point(4, 3)),
        Pair(colorId: 3, a: Point(0, 5), b: Point(3, 4)),
        Pair(colorId: 0, a: Point(3, 2), b: Point(2, 4)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(5, 2)),
      ],
      solution: {
        2: [Point(2, 1), Point(3, 1), Point(4, 1), Point(4, 2), Point(4, 3), ],
        3: [Point(0, 5), Point(1, 5), Point(2, 5), Point(3, 5), Point(3, 4), ],
        0: [Point(3, 2), Point(3, 3), Point(2, 3), Point(2, 4), ],
        1: [Point(2, 2), Point(1, 2), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 1), b: Point(0, 5)),
        Pair(colorId: 2, a: Point(5, 0), b: Point(5, 4)),
        Pair(colorId: 1, a: Point(1, 2), b: Point(1, 5)),
        Pair(colorId: 3, a: Point(2, 3), b: Point(2, 0)),
      ],
      solution: {
        0: [Point(3, 1), Point(2, 1), Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        2: [Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), ],
        1: [Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), ],
        3: [Point(2, 3), Point(3, 3), Point(4, 3), Point(4, 2), Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(5, 5), b: Point(2, 0)),
        Pair(colorId: 2, a: Point(5, 3), b: Point(4, 0)),
        Pair(colorId: 0, a: Point(2, 2), b: Point(3, 4)),
        Pair(colorId: 3, a: Point(1, 0), b: Point(0, 2)),
      ],
      solution: {
        1: [Point(5, 5), Point(5, 4), Point(4, 4), Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 4), Point(2, 3), Point(1, 3), Point(1, 2), Point(1, 1), Point(2, 1), Point(3, 1), Point(3, 0), Point(2, 0), ],
        2: [Point(5, 3), Point(4, 3), Point(4, 2), Point(4, 1), Point(4, 0), ],
        0: [Point(2, 2), Point(3, 2), Point(3, 3), Point(3, 4), ],
        3: [Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(4, 2), b: Point(2, 5)),
        Pair(colorId: 3, a: Point(5, 2), b: Point(2, 0)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(3, 5)),
        Pair(colorId: 2, a: Point(5, 4), b: Point(3, 3)),
      ],
      solution: {
        0: [Point(4, 2), Point(3, 2), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 2), Point(1, 3), Point(0, 3), Point(0, 4), Point(1, 4), Point(1, 5), Point(2, 5), ],
        3: [Point(5, 2), Point(5, 1), Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), ],
        1: [Point(2, 2), Point(2, 3), Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 5), Point(3, 5), ],
        2: [Point(5, 4), Point(5, 3), Point(4, 3), Point(3, 3), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(4, 1), b: Point(1, 4)),
        Pair(colorId: 2, a: Point(5, 5), b: Point(4, 0)),
        Pair(colorId: 3, a: Point(1, 3), b: Point(4, 2)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(3, 0)),
      ],
      solution: {
        0: [Point(4, 1), Point(3, 1), Point(3, 2), Point(3, 3), Point(2, 3), Point(2, 4), Point(1, 4), ],
        2: [Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), Point(5, 0), Point(4, 0), ],
        3: [Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), Point(1, 5), Point(2, 5), Point(3, 5), Point(4, 5), Point(4, 4), Point(4, 3), Point(4, 2), ],
        1: [Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(5, 5), b: Point(0, 1)),
        Pair(colorId: 0, a: Point(5, 0), b: Point(2, 2)),
        Pair(colorId: 1, a: Point(1, 5), b: Point(0, 3)),
        Pair(colorId: 2, a: Point(5, 2), b: Point(4, 4)),
      ],
      solution: {
        3: [Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 4), Point(1, 4), Point(1, 3), Point(1, 2), Point(0, 2), Point(0, 1), ],
        0: [Point(5, 0), Point(4, 0), Point(4, 1), Point(3, 1), Point(3, 0), Point(2, 0), Point(2, 1), Point(2, 2), ],
        1: [Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), ],
        2: [Point(5, 2), Point(4, 2), Point(4, 3), Point(3, 3), Point(3, 4), Point(4, 4), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 4), b: Point(4, 1)),
        Pair(colorId: 2, a: Point(3, 5), b: Point(5, 2)),
        Pair(colorId: 1, a: Point(1, 4), b: Point(2, 1)),
        Pair(colorId: 3, a: Point(0, 0), b: Point(0, 3)),
      ],
      solution: {
        0: [Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), Point(4, 1), ],
        2: [Point(3, 5), Point(4, 5), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), ],
        1: [Point(1, 4), Point(1, 3), Point(2, 3), Point(2, 2), Point(2, 1), ],
        3: [Point(0, 0), Point(0, 1), Point(1, 1), Point(1, 2), Point(0, 2), Point(0, 3), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(4, 1), b: Point(5, 4)),
        Pair(colorId: 0, a: Point(2, 3), b: Point(3, 5)),
        Pair(colorId: 2, a: Point(0, 2), b: Point(1, 0)),
        Pair(colorId: 3, a: Point(4, 0), b: Point(3, 2)),
      ],
      solution: {
        1: [Point(4, 1), Point(5, 1), Point(5, 2), Point(4, 2), Point(4, 3), Point(5, 3), Point(5, 4), ],
        0: [Point(2, 3), Point(3, 3), Point(3, 4), Point(3, 5), ],
        2: [Point(0, 2), Point(1, 2), Point(1, 1), Point(1, 0), ],
        3: [Point(4, 0), Point(3, 0), Point(3, 1), Point(3, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 0), b: Point(3, 1)),
        Pair(colorId: 1, a: Point(5, 5), b: Point(3, 4)),
        Pair(colorId: 2, a: Point(5, 2), b: Point(2, 2)),
        Pair(colorId: 3, a: Point(3, 3), b: Point(1, 2)),
      ],
      solution: {
        0: [Point(0, 0), Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), Point(3, 1), ],
        1: [Point(5, 5), Point(4, 5), Point(3, 5), Point(3, 4), ],
        2: [Point(5, 2), Point(4, 2), Point(3, 2), Point(2, 2), ],
        3: [Point(3, 3), Point(2, 3), Point(1, 3), Point(1, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(4, 5), b: Point(1, 4)),
        Pair(colorId: 0, a: Point(1, 1), b: Point(4, 1)),
        Pair(colorId: 1, a: Point(4, 3), b: Point(2, 2)),
        Pair(colorId: 2, a: Point(2, 5), b: Point(0, 4)),
      ],
      solution: {
        3: [Point(4, 5), Point(3, 5), Point(3, 4), Point(2, 4), Point(1, 4), ],
        0: [Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), ],
        1: [Point(4, 3), Point(4, 4), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(1, 2), Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), Point(2, 2), ],
        2: [Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 4), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 4), b: Point(4, 3)),
        Pair(colorId: 3, a: Point(4, 2), b: Point(2, 4)),
        Pair(colorId: 1, a: Point(5, 1), b: Point(2, 1)),
        Pair(colorId: 2, a: Point(2, 2), b: Point(4, 1)),
      ],
      solution: {
        0: [Point(0, 4), Point(1, 4), Point(1, 3), Point(2, 3), Point(3, 3), Point(4, 3), ],
        3: [Point(4, 2), Point(5, 2), Point(5, 3), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), ],
        1: [Point(5, 1), Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(2, 1), ],
        2: [Point(2, 2), Point(3, 2), Point(3, 1), Point(4, 1), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 1), b: Point(5, 1)),
        Pair(colorId: 2, a: Point(5, 5), b: Point(3, 3)),
        Pair(colorId: 3, a: Point(4, 3), b: Point(2, 5)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(1, 3)),
      ],
      solution: {
        1: [Point(0, 1), Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), ],
        2: [Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(4, 2), Point(3, 2), Point(3, 3), ],
        3: [Point(4, 3), Point(4, 4), Point(4, 5), Point(3, 5), Point(2, 5), ],
        0: [Point(3, 4), Point(2, 4), Point(2, 3), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 3), Point(1, 3), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(3, 5), b: Point(5, 1)),
        Pair(colorId: 0, a: Point(0, 3), b: Point(2, 5)),
        Pair(colorId: 1, a: Point(4, 3), b: Point(2, 1)),
        Pair(colorId: 2, a: Point(3, 0), b: Point(1, 2)),
      ],
      solution: {
        3: [Point(3, 5), Point(4, 5), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), ],
        0: [Point(0, 3), Point(1, 3), Point(2, 3), Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 5), Point(1, 5), Point(2, 5), ],
        1: [Point(4, 3), Point(4, 4), Point(3, 4), Point(3, 3), Point(3, 2), Point(2, 2), Point(2, 1), ],
        2: [Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), Point(1, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(4, 5), b: Point(0, 1)),
        Pair(colorId: 3, a: Point(0, 0), b: Point(4, 2)),
        Pair(colorId: 1, a: Point(3, 2), b: Point(1, 1)),
        Pair(colorId: 2, a: Point(5, 4), b: Point(3, 3)),
      ],
      solution: {
        0: [Point(4, 5), Point(4, 4), Point(3, 4), Point(3, 5), Point(2, 5), Point(2, 4), Point(1, 4), Point(1, 3), Point(0, 3), Point(0, 2), Point(0, 1), ],
        3: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), Point(4, 2), ],
        1: [Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 1), ],
        2: [Point(5, 4), Point(5, 3), Point(4, 3), Point(3, 3), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(1, 0), b: Point(0, 4)),
        Pair(colorId: 0, a: Point(2, 3), b: Point(3, 0)),
        Pair(colorId: 2, a: Point(0, 0), b: Point(0, 3)),
        Pair(colorId: 3, a: Point(3, 1), b: Point(4, 3)),
      ],
      solution: {
        1: [Point(1, 0), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(0, 4), ],
        0: [Point(2, 3), Point(2, 2), Point(2, 1), Point(2, 0), Point(3, 0), ],
        2: [Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), ],
        3: [Point(3, 1), Point(4, 1), Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(4, 3), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 5), b: Point(4, 2)),
        Pair(colorId: 1, a: Point(5, 1), b: Point(4, 5)),
        Pair(colorId: 3, a: Point(0, 4), b: Point(1, 1)),
        Pair(colorId: 2, a: Point(3, 1), b: Point(1, 0)),
      ],
      solution: {
        0: [Point(0, 5), Point(1, 5), Point(2, 5), Point(3, 5), Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
        1: [Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), Point(4, 5), ],
        3: [Point(0, 4), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), ],
        2: [Point(3, 1), Point(2, 1), Point(2, 0), Point(1, 0), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 5), b: Point(2, 2)),
        Pair(colorId: 2, a: Point(5, 4), b: Point(3, 2)),
        Pair(colorId: 3, a: Point(2, 4), b: Point(0, 2)),
        Pair(colorId: 1, a: Point(4, 0), b: Point(5, 2)),
      ],
      solution: {
        0: [Point(3, 5), Point(3, 4), Point(3, 3), Point(2, 3), Point(2, 2), ],
        2: [Point(5, 4), Point(4, 4), Point(4, 3), Point(4, 2), Point(3, 2), ],
        3: [Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), ],
        1: [Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(1, 1), b: Point(1, 5)),
        Pair(colorId: 2, a: Point(4, 0), b: Point(5, 3)),
        Pair(colorId: 3, a: Point(5, 4), b: Point(3, 2)),
        Pair(colorId: 0, a: Point(2, 0), b: Point(1, 2)),
      ],
      solution: {
        1: [Point(1, 1), Point(2, 1), Point(2, 2), Point(2, 3), Point(1, 3), Point(1, 4), Point(1, 5), ],
        2: [Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), ],
        3: [Point(5, 4), Point(4, 4), Point(3, 4), Point(3, 3), Point(3, 2), ],
        0: [Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(1, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 3), b: Point(2, 1)),
        Pair(colorId: 1, a: Point(1, 2), b: Point(3, 4)),
        Pair(colorId: 2, a: Point(5, 3), b: Point(4, 1)),
        Pair(colorId: 3, a: Point(4, 2), b: Point(5, 4)),
      ],
      solution: {
        0: [Point(0, 3), Point(1, 3), Point(2, 3), Point(2, 2), Point(2, 1), ],
        1: [Point(1, 2), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), Point(3, 1), Point(3, 2), Point(3, 3), Point(3, 4), ],
        2: [Point(5, 3), Point(5, 2), Point(5, 1), Point(5, 0), Point(4, 0), Point(4, 1), ],
        3: [Point(4, 2), Point(4, 3), Point(4, 4), Point(5, 4), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(4, 3), b: Point(2, 0)),
        Pair(colorId: 3, a: Point(5, 0), b: Point(3, 3)),
        Pair(colorId: 2, a: Point(1, 1), b: Point(1, 5)),
        Pair(colorId: 0, a: Point(2, 1), b: Point(1, 3)),
      ],
      solution: {
        1: [Point(4, 3), Point(4, 2), Point(3, 2), Point(3, 1), Point(3, 0), Point(2, 0), ],
        3: [Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(4, 4), Point(3, 4), Point(3, 3), ],
        2: [Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(1, 5), ],
        0: [Point(2, 1), Point(2, 2), Point(1, 2), Point(1, 3), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(1, 4), b: Point(2, 0)),
        Pair(colorId: 1, a: Point(3, 4), b: Point(0, 3)),
        Pair(colorId: 0, a: Point(3, 1), b: Point(5, 0)),
        Pair(colorId: 2, a: Point(5, 4), b: Point(4, 2)),
      ],
      solution: {
        3: [Point(1, 4), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), Point(2, 0), ],
        1: [Point(3, 4), Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), ],
        0: [Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 0), ],
        2: [Point(5, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 0), b: Point(5, 1)),
        Pair(colorId: 1, a: Point(2, 1), b: Point(0, 2)),
        Pair(colorId: 2, a: Point(2, 4), b: Point(4, 5)),
        Pair(colorId: 3, a: Point(5, 2), b: Point(2, 2)),
      ],
      solution: {
        0: [Point(3, 0), Point(3, 1), Point(4, 1), Point(4, 0), Point(5, 0), Point(5, 1), ],
        1: [Point(2, 1), Point(1, 1), Point(0, 1), Point(0, 2), ],
        2: [Point(2, 4), Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), Point(1, 5), Point(2, 5), Point(3, 5), Point(3, 4), Point(3, 3), Point(4, 3), Point(5, 3), Point(5, 4), Point(4, 4), Point(4, 5), ],
        3: [Point(5, 2), Point(4, 2), Point(3, 2), Point(2, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(5, 4), b: Point(1, 1)),
        Pair(colorId: 0, a: Point(5, 5), b: Point(0, 4)),
        Pair(colorId: 1, a: Point(5, 1), b: Point(3, 2)),
        Pair(colorId: 3, a: Point(3, 3), b: Point(4, 1)),
      ],
      solution: {
        2: [Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), ],
        0: [Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 4), ],
        1: [Point(5, 1), Point(5, 2), Point(4, 2), Point(3, 2), ],
        3: [Point(3, 3), Point(2, 3), Point(2, 2), Point(2, 1), Point(3, 1), Point(4, 1), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(0, 4), b: Point(2, 2)),
        Pair(colorId: 0, a: Point(3, 1), b: Point(5, 0)),
        Pair(colorId: 1, a: Point(5, 4), b: Point(5, 1)),
        Pair(colorId: 2, a: Point(2, 5), b: Point(4, 4)),
      ],
      solution: {
        3: [Point(0, 4), Point(1, 4), Point(1, 3), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), Point(2, 1), Point(2, 2), ],
        0: [Point(3, 1), Point(4, 1), Point(4, 0), Point(5, 0), ],
        1: [Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), ],
        2: [Point(2, 5), Point(3, 5), Point(3, 4), Point(2, 4), Point(2, 3), Point(3, 3), Point(3, 2), Point(4, 2), Point(4, 3), Point(4, 4), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 0), b: Point(5, 0)),
        Pair(colorId: 3, a: Point(3, 5), b: Point(5, 3)),
        Pair(colorId: 0, a: Point(1, 3), b: Point(2, 5)),
        Pair(colorId: 2, a: Point(3, 4), b: Point(0, 4)),
      ],
      solution: {
        1: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), ],
        3: [Point(3, 5), Point(4, 5), Point(4, 4), Point(5, 4), Point(5, 3), ],
        0: [Point(1, 3), Point(2, 3), Point(2, 4), Point(2, 5), ],
        2: [Point(3, 4), Point(3, 3), Point(3, 2), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(0, 0), b: Point(1, 4)),
        Pair(colorId: 0, a: Point(3, 2), b: Point(1, 3)),
        Pair(colorId: 1, a: Point(3, 5), b: Point(4, 3)),
        Pair(colorId: 2, a: Point(1, 0), b: Point(3, 1)),
      ],
      solution: {
        3: [Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), ],
        0: [Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), ],
        1: [Point(3, 5), Point(4, 5), Point(4, 4), Point(4, 3), ],
        2: [Point(1, 0), Point(2, 0), Point(3, 0), Point(3, 1), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 4), b: Point(4, 5)),
        Pair(colorId: 2, a: Point(2, 2), b: Point(0, 0)),
        Pair(colorId: 1, a: Point(5, 5), b: Point(3, 4)),
        Pair(colorId: 3, a: Point(3, 3), b: Point(5, 2)),
      ],
      solution: {
        0: [Point(1, 4), Point(2, 4), Point(2, 5), Point(3, 5), Point(4, 5), ],
        2: [Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 1), Point(0, 0), ],
        1: [Point(5, 5), Point(5, 4), Point(5, 3), Point(4, 3), Point(4, 4), Point(3, 4), ],
        3: [Point(3, 3), Point(3, 2), Point(4, 2), Point(5, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 3), b: Point(5, 5)),
        Pair(colorId: 3, a: Point(4, 1), b: Point(3, 5)),
        Pair(colorId: 1, a: Point(3, 0), b: Point(1, 1)),
        Pair(colorId: 2, a: Point(0, 3), b: Point(0, 0)),
      ],
      solution: {
        0: [Point(2, 3), Point(3, 3), Point(3, 4), Point(4, 4), Point(4, 5), Point(5, 5), ],
        3: [Point(4, 1), Point(3, 1), Point(2, 1), Point(2, 2), Point(1, 2), Point(1, 3), Point(1, 4), Point(2, 4), Point(2, 5), Point(3, 5), ],
        1: [Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), ],
        2: [Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 3), b: Point(4, 0)),
        Pair(colorId: 3, a: Point(2, 5), b: Point(3, 1)),
        Pair(colorId: 2, a: Point(5, 2), b: Point(3, 4)),
        Pair(colorId: 0, a: Point(1, 1), b: Point(3, 0)),
      ],
      solution: {
        1: [Point(2, 3), Point(3, 3), Point(4, 3), Point(4, 2), Point(4, 1), Point(4, 0), ],
        3: [Point(2, 5), Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), Point(2, 2), Point(3, 2), Point(3, 1), ],
        2: [Point(5, 2), Point(5, 3), Point(5, 4), Point(4, 4), Point(4, 5), Point(3, 5), Point(3, 4), ],
        0: [Point(1, 1), Point(2, 1), Point(2, 0), Point(3, 0), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 3), b: Point(5, 0)),
        Pair(colorId: 3, a: Point(0, 4), b: Point(5, 4)),
        Pair(colorId: 2, a: Point(1, 4), b: Point(4, 3)),
        Pair(colorId: 0, a: Point(3, 0), b: Point(1, 1)),
      ],
      solution: {
        1: [Point(0, 3), Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), Point(4, 2), Point(5, 2), Point(5, 1), Point(5, 0), ],
        3: [Point(0, 4), Point(0, 5), Point(1, 5), Point(2, 5), Point(3, 5), Point(4, 5), Point(5, 5), Point(5, 4), ],
        2: [Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), ],
        0: [Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(5, 4), b: Point(2, 2)),
        Pair(colorId: 4, a: Point(0, 2), b: Point(3, 4)),
        Pair(colorId: 0, a: Point(5, 3), b: Point(5, 0)),
        Pair(colorId: 2, a: Point(2, 0), b: Point(3, 2)),
        Pair(colorId: 3, a: Point(3, 1), b: Point(1, 0)),
      ],
      solution: {
        1: [Point(5, 4), Point(4, 4), Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 2), ],
        4: [Point(0, 2), Point(1, 2), Point(1, 3), Point(1, 4), Point(2, 4), Point(3, 4), ],
        0: [Point(5, 3), Point(5, 2), Point(5, 1), Point(5, 0), ],
        2: [Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), Point(4, 2), Point(3, 2), ],
        3: [Point(3, 1), Point(2, 1), Point(1, 1), Point(0, 1), Point(0, 0), Point(1, 0), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(1, 5), b: Point(0, 0)),
        Pair(colorId: 0, a: Point(3, 3), b: Point(1, 4)),
        Pair(colorId: 1, a: Point(3, 0), b: Point(1, 1)),
        Pair(colorId: 2, a: Point(2, 1), b: Point(4, 0)),
        Pair(colorId: 3, a: Point(5, 1), b: Point(5, 4)),
      ],
      solution: {
        4: [Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        0: [Point(3, 3), Point(2, 3), Point(1, 3), Point(1, 4), ],
        1: [Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), ],
        2: [Point(2, 1), Point(2, 2), Point(3, 2), Point(3, 1), Point(4, 1), Point(4, 0), ],
        3: [Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(3, 5), b: Point(4, 1)),
        Pair(colorId: 2, a: Point(4, 5), b: Point(4, 0)),
        Pair(colorId: 0, a: Point(1, 2), b: Point(1, 5)),
        Pair(colorId: 3, a: Point(2, 1), b: Point(3, 3)),
      ],
      solution: {
        1: [Point(3, 5), Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), Point(4, 1), ],
        2: [Point(4, 5), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), Point(5, 0), Point(4, 0), ],
        0: [Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), ],
        3: [Point(2, 1), Point(3, 1), Point(3, 2), Point(3, 3), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(1, 1), b: Point(0, 5)),
        Pair(colorId: 0, a: Point(1, 4), b: Point(4, 3)),
        Pair(colorId: 1, a: Point(4, 4), b: Point(4, 1)),
        Pair(colorId: 2, a: Point(2, 3), b: Point(4, 2)),
      ],
      solution: {
        3: [Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        0: [Point(1, 4), Point(2, 4), Point(3, 4), Point(3, 3), Point(4, 3), ],
        1: [Point(4, 4), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), Point(4, 1), ],
        2: [Point(2, 3), Point(1, 3), Point(1, 2), Point(2, 2), Point(2, 1), Point(3, 1), Point(3, 2), Point(4, 2), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(5, 5), b: Point(5, 0)),
        Pair(colorId: 0, a: Point(1, 3), b: Point(1, 0)),
        Pair(colorId: 1, a: Point(4, 5), b: Point(2, 4)),
        Pair(colorId: 3, a: Point(3, 5), b: Point(0, 5)),
      ],
      solution: {
        2: [Point(5, 5), Point(5, 4), Point(5, 3), Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 2), Point(3, 2), Point(4, 2), Point(5, 2), Point(5, 1), Point(4, 1), Point(4, 0), Point(5, 0), ],
        0: [Point(1, 3), Point(1, 2), Point(1, 1), Point(1, 0), ],
        1: [Point(4, 5), Point(4, 4), Point(3, 4), Point(2, 4), ],
        3: [Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(5, 0), b: Point(3, 4)),
        Pair(colorId: 3, a: Point(4, 1), b: Point(0, 3)),
        Pair(colorId: 0, a: Point(4, 2), b: Point(2, 4)),
        Pair(colorId: 2, a: Point(1, 2), b: Point(3, 1)),
      ],
      solution: {
        1: [Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(4, 3), Point(3, 3), Point(3, 4), ],
        3: [Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), ],
        0: [Point(4, 2), Point(3, 2), Point(2, 2), Point(2, 3), Point(1, 3), Point(1, 4), Point(1, 5), Point(2, 5), Point(2, 4), ],
        2: [Point(1, 2), Point(1, 1), Point(2, 1), Point(3, 1), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 5), b: Point(3, 1)),
        Pair(colorId: 2, a: Point(2, 0), b: Point(4, 3)),
        Pair(colorId: 3, a: Point(0, 1), b: Point(0, 5)),
        Pair(colorId: 0, a: Point(5, 4), b: Point(5, 1)),
      ],
      solution: {
        1: [Point(2, 5), Point(3, 5), Point(3, 4), Point(3, 3), Point(3, 2), Point(3, 1), ],
        2: [Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), Point(4, 2), Point(4, 3), ],
        3: [Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        0: [Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 4), b: Point(5, 2)),
        Pair(colorId: 0, a: Point(3, 5), b: Point(4, 1)),
        Pair(colorId: 3, a: Point(2, 0), b: Point(5, 1)),
        Pair(colorId: 1, a: Point(3, 1), b: Point(1, 0)),
      ],
      solution: {
        2: [Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), Point(5, 4), Point(5, 3), Point(5, 2), ],
        0: [Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), Point(1, 3), Point(2, 3), Point(3, 3), Point(4, 3), Point(4, 2), Point(4, 1), ],
        3: [Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), ],
        1: [Point(3, 1), Point(3, 2), Point(2, 2), Point(2, 1), Point(1, 1), Point(1, 2), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 0), b: Point(3, 4)),
        Pair(colorId: 3, a: Point(0, 2), b: Point(4, 3)),
        Pair(colorId: 1, a: Point(5, 2), b: Point(3, 1)),
        Pair(colorId: 2, a: Point(1, 3), b: Point(0, 1)),
      ],
      solution: {
        0: [Point(1, 0), Point(2, 0), Point(2, 1), Point(2, 2), Point(3, 2), Point(3, 3), Point(3, 4), ],
        3: [Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(2, 4), Point(2, 5), Point(3, 5), Point(4, 5), Point(4, 4), Point(4, 3), ],
        1: [Point(5, 2), Point(4, 2), Point(4, 1), Point(5, 1), Point(5, 0), Point(4, 0), Point(3, 0), Point(3, 1), ],
        2: [Point(1, 3), Point(1, 2), Point(1, 1), Point(0, 1), ],
      },
    ),
    Level(
      size: 6,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(5, 1), b: Point(2, 4)),
        Pair(colorId: 0, a: Point(3, 5), b: Point(5, 2)),
        Pair(colorId: 3, a: Point(1, 1), b: Point(0, 5)),
        Pair(colorId: 1, a: Point(3, 1), b: Point(1, 0)),
      ],
      solution: {
        2: [Point(5, 1), Point(4, 1), Point(4, 2), Point(3, 2), Point(2, 2), Point(2, 3), Point(2, 4), ],
        0: [Point(3, 5), Point(4, 5), Point(5, 5), Point(5, 4), Point(4, 4), Point(3, 4), Point(3, 3), Point(4, 3), Point(5, 3), Point(5, 2), ],
        3: [Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        1: [Point(3, 1), Point(2, 1), Point(2, 0), Point(1, 0), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 1), b: Point(5, 4)),
        Pair(colorId: 0, a: Point(6, 4), b: Point(1, 4)),
        Pair(colorId: 2, a: Point(6, 6), b: Point(1, 6)),
        Pair(colorId: 3, a: Point(1, 5), b: Point(3, 2)),
        Pair(colorId: 4, a: Point(5, 2), b: Point(1, 2)),
      ],
      solution: {
        1: [Point(2, 1), Point(3, 1), Point(4, 1), Point(4, 2), Point(4, 3), Point(5, 3), Point(5, 4), ],
        0: [Point(6, 4), Point(6, 5), Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 4), Point(1, 4), ],
        2: [Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), ],
        3: [Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), ],
        4: [Point(5, 2), Point(5, 1), Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), Point(1, 2), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(6, 3), b: Point(2, 6)),
        Pair(colorId: 0, a: Point(5, 4), b: Point(3, 0)),
        Pair(colorId: 1, a: Point(0, 4), b: Point(4, 5)),
        Pair(colorId: 2, a: Point(4, 3), b: Point(5, 0)),
        Pair(colorId: 3, a: Point(0, 3), b: Point(2, 1)),
      ],
      solution: {
        4: [Point(6, 3), Point(6, 4), Point(6, 5), Point(5, 5), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), ],
        0: [Point(5, 4), Point(4, 4), Point(3, 4), Point(3, 3), Point(3, 2), Point(3, 1), Point(3, 0), ],
        1: [Point(0, 4), Point(1, 4), Point(2, 4), Point(2, 5), Point(3, 5), Point(4, 5), ],
        2: [Point(4, 3), Point(5, 3), Point(5, 2), Point(5, 1), Point(5, 0), ],
        3: [Point(0, 3), Point(1, 3), Point(2, 3), Point(2, 2), Point(2, 1), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(4, 2), b: Point(0, 0)),
        Pair(colorId: 1, a: Point(5, 3), b: Point(2, 0)),
        Pair(colorId: 2, a: Point(3, 6), b: Point(6, 5)),
        Pair(colorId: 3, a: Point(4, 4), b: Point(4, 0)),
        Pair(colorId: 4, a: Point(2, 6), b: Point(1, 3)),
      ],
      solution: {
        0: [Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 1), Point(0, 0), ],
        1: [Point(5, 3), Point(5, 2), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), Point(2, 0), ],
        2: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), ],
        3: [Point(4, 4), Point(5, 4), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), Point(5, 0), Point(4, 0), ],
        4: [Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(1, 5), Point(2, 5), Point(3, 5), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 5), b: Point(5, 3)),
        Pair(colorId: 1, a: Point(5, 4), b: Point(1, 2)),
        Pair(colorId: 2, a: Point(1, 4), b: Point(3, 2)),
        Pair(colorId: 3, a: Point(2, 2), b: Point(4, 0)),
        Pair(colorId: 4, a: Point(3, 6), b: Point(6, 5)),
      ],
      solution: {
        0: [Point(0, 5), Point(1, 5), Point(2, 5), Point(3, 5), Point(4, 5), Point(4, 4), Point(4, 3), Point(5, 3), ],
        1: [Point(5, 4), Point(6, 4), Point(6, 3), Point(6, 2), Point(5, 2), Point(4, 2), Point(4, 1), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 2), ],
        2: [Point(1, 4), Point(2, 4), Point(3, 4), Point(3, 3), Point(3, 2), ],
        3: [Point(2, 2), Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), ],
        4: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 6), b: Point(4, 1)),
        Pair(colorId: 3, a: Point(6, 2), b: Point(1, 0)),
        Pair(colorId: 0, a: Point(0, 0), b: Point(2, 2)),
        Pair(colorId: 2, a: Point(3, 2), b: Point(2, 5)),
        Pair(colorId: 4, a: Point(5, 3), b: Point(6, 6)),
      ],
      solution: {
        1: [Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), Point(4, 4), Point(4, 3), Point(4, 2), Point(4, 1), ],
        3: [Point(6, 2), Point(5, 2), Point(5, 1), Point(6, 1), Point(6, 0), Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(2, 1), Point(1, 1), Point(1, 0), ],
        0: [Point(0, 0), Point(0, 1), Point(0, 2), Point(1, 2), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(1, 5), Point(1, 4), Point(2, 4), Point(2, 3), Point(2, 2), ],
        2: [Point(3, 2), Point(3, 3), Point(3, 4), Point(3, 5), Point(2, 5), ],
        4: [Point(5, 3), Point(5, 4), Point(6, 4), Point(6, 5), Point(5, 5), Point(5, 6), Point(6, 6), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(4, 3), b: Point(6, 0)),
        Pair(colorId: 0, a: Point(0, 4), b: Point(0, 0)),
        Pair(colorId: 2, a: Point(5, 6), b: Point(5, 2)),
        Pair(colorId: 3, a: Point(2, 3), b: Point(1, 0)),
        Pair(colorId: 4, a: Point(4, 1), b: Point(6, 3)),
      ],
      solution: {
        1: [Point(4, 3), Point(3, 3), Point(3, 2), Point(3, 1), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), ],
        0: [Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        2: [Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), ],
        3: [Point(2, 3), Point(2, 4), Point(2, 5), Point(3, 5), Point(4, 5), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), Point(1, 0), ],
        4: [Point(4, 1), Point(5, 1), Point(6, 1), Point(6, 2), Point(6, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(5, 0), b: Point(6, 6)),
        Pair(colorId: 2, a: Point(2, 5), b: Point(0, 1)),
        Pair(colorId: 4, a: Point(5, 5), b: Point(4, 0)),
        Pair(colorId: 0, a: Point(1, 5), b: Point(1, 1)),
        Pair(colorId: 1, a: Point(0, 2), b: Point(4, 2)),
      ],
      solution: {
        3: [Point(5, 0), Point(6, 0), Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), ],
        2: [Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), ],
        4: [Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), Point(4, 1), Point(4, 0), ],
        0: [Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), ],
        1: [Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), Point(4, 4), Point(4, 3), Point(4, 2), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(5, 0), b: Point(0, 3)),
        Pair(colorId: 4, a: Point(6, 1), b: Point(3, 5)),
        Pair(colorId: 1, a: Point(5, 4), b: Point(0, 5)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(5, 2)),
        Pair(colorId: 3, a: Point(4, 3), b: Point(6, 5)),
      ],
      solution: {
        2: [Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), ],
        4: [Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), Point(2, 2), Point(2, 3), Point(2, 4), Point(2, 5), Point(3, 5), ],
        1: [Point(5, 4), Point(4, 4), Point(4, 5), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), ],
        0: [Point(3, 4), Point(3, 3), Point(3, 2), Point(4, 2), Point(5, 2), ],
        3: [Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 4), Point(6, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 0), b: Point(2, 5)),
        Pair(colorId: 3, a: Point(4, 1), b: Point(6, 6)),
        Pair(colorId: 0, a: Point(6, 3), b: Point(4, 0)),
        Pair(colorId: 2, a: Point(3, 0), b: Point(2, 4)),
        Pair(colorId: 4, a: Point(5, 6), b: Point(3, 3)),
      ],
      solution: {
        1: [Point(0, 0), Point(1, 0), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), Point(2, 5), ],
        3: [Point(4, 1), Point(5, 1), Point(5, 2), Point(5, 3), Point(4, 3), Point(4, 4), Point(5, 4), Point(6, 4), Point(6, 5), Point(6, 6), ],
        0: [Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), Point(5, 0), Point(4, 0), ],
        2: [Point(3, 0), Point(2, 0), Point(2, 1), Point(2, 2), Point(2, 3), Point(2, 4), ],
        4: [Point(5, 6), Point(5, 5), Point(4, 5), Point(4, 6), Point(3, 6), Point(3, 5), Point(3, 4), Point(3, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(6, 6), b: Point(2, 1)),
        Pair(colorId: 3, a: Point(0, 4), b: Point(2, 0)),
        Pair(colorId: 0, a: Point(1, 3), b: Point(2, 6)),
        Pair(colorId: 1, a: Point(4, 1), b: Point(3, 4)),
        Pair(colorId: 2, a: Point(4, 0), b: Point(4, 4)),
      ],
      solution: {
        4: [Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(3, 5), Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), ],
        3: [Point(0, 4), Point(0, 3), Point(0, 2), Point(1, 2), Point(1, 1), Point(1, 0), Point(2, 0), ],
        0: [Point(1, 3), Point(1, 4), Point(1, 5), Point(0, 5), Point(0, 6), Point(1, 6), Point(2, 6), ],
        1: [Point(4, 1), Point(3, 1), Point(3, 2), Point(3, 3), Point(3, 4), ],
        2: [Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(4, 2), Point(4, 3), Point(4, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 2), b: Point(3, 0)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(0, 5)),
        Pair(colorId: 3, a: Point(1, 1), b: Point(5, 0)),
        Pair(colorId: 4, a: Point(2, 3), b: Point(5, 5)),
        Pair(colorId: 2, a: Point(3, 6), b: Point(4, 3)),
      ],
      solution: {
        0: [Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), ],
        1: [Point(2, 2), Point(1, 2), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), ],
        3: [Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 0), ],
        4: [Point(2, 3), Point(3, 3), Point(3, 4), Point(4, 4), Point(5, 4), Point(5, 5), ],
        2: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(5, 3), Point(4, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(6, 6), b: Point(4, 2)),
        Pair(colorId: 4, a: Point(0, 2), b: Point(4, 4)),
        Pair(colorId: 0, a: Point(2, 0), b: Point(6, 1)),
        Pair(colorId: 2, a: Point(4, 6), b: Point(0, 5)),
        Pair(colorId: 1, a: Point(1, 1), b: Point(3, 3)),
      ],
      solution: {
        3: [Point(6, 6), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), Point(4, 3), Point(4, 2), ],
        4: [Point(0, 2), Point(1, 2), Point(2, 2), Point(2, 3), Point(2, 4), Point(3, 4), Point(4, 4), ],
        0: [Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), Point(5, 1), Point(5, 2), Point(6, 2), Point(6, 1), ],
        2: [Point(4, 6), Point(4, 5), Point(3, 5), Point(3, 6), Point(2, 6), Point(2, 5), Point(1, 5), Point(1, 6), Point(0, 6), Point(0, 5), ],
        1: [Point(1, 1), Point(2, 1), Point(3, 1), Point(3, 2), Point(3, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 0), b: Point(5, 3)),
        Pair(colorId: 3, a: Point(3, 0), b: Point(6, 2)),
        Pair(colorId: 0, a: Point(6, 3), b: Point(2, 3)),
        Pair(colorId: 1, a: Point(1, 6), b: Point(4, 5)),
        Pair(colorId: 4, a: Point(1, 4), b: Point(3, 2)),
      ],
      solution: {
        2: [Point(2, 0), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 2), Point(5, 3), ],
        3: [Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(6, 1), Point(6, 2), ],
        0: [Point(6, 3), Point(6, 4), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(2, 3), ],
        1: [Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), ],
        4: [Point(1, 4), Point(1, 3), Point(1, 2), Point(2, 2), Point(3, 2), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(6, 2), b: Point(1, 0)),
        Pair(colorId: 3, a: Point(6, 5), b: Point(1, 6)),
        Pair(colorId: 4, a: Point(6, 4), b: Point(1, 4)),
        Pair(colorId: 1, a: Point(0, 4), b: Point(0, 0)),
        Pair(colorId: 2, a: Point(2, 6), b: Point(6, 6)),
      ],
      solution: {
        0: [Point(6, 2), Point(5, 2), Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 1), Point(1, 0), ],
        3: [Point(6, 5), Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(1, 6), ],
        4: [Point(6, 4), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), ],
        1: [Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        2: [Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(0, 6), b: Point(5, 4)),
        Pair(colorId: 0, a: Point(1, 1), b: Point(4, 4)),
        Pair(colorId: 1, a: Point(6, 2), b: Point(3, 1)),
        Pair(colorId: 2, a: Point(2, 3), b: Point(3, 0)),
        Pair(colorId: 4, a: Point(4, 3), b: Point(5, 6)),
      ],
      solution: {
        3: [Point(0, 6), Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), Point(5, 5), Point(5, 4), ],
        0: [Point(1, 1), Point(2, 1), Point(2, 2), Point(3, 2), Point(3, 3), Point(3, 4), Point(4, 4), ],
        1: [Point(6, 2), Point(5, 2), Point(4, 2), Point(4, 1), Point(3, 1), ],
        2: [Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), ],
        4: [Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), Point(5, 6), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 6), b: Point(0, 1)),
        Pair(colorId: 4, a: Point(6, 6), b: Point(6, 0)),
        Pair(colorId: 0, a: Point(2, 3), b: Point(1, 0)),
        Pair(colorId: 1, a: Point(4, 4), b: Point(5, 1)),
        Pair(colorId: 3, a: Point(3, 3), b: Point(4, 0)),
      ],
      solution: {
        2: [Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), ],
        4: [Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), ],
        0: [Point(2, 3), Point(1, 3), Point(1, 2), Point(1, 1), Point(1, 0), ],
        1: [Point(4, 4), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), ],
        3: [Point(3, 3), Point(4, 3), Point(4, 2), Point(4, 1), Point(4, 0), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(5, 4), b: Point(1, 2)),
        Pair(colorId: 0, a: Point(3, 6), b: Point(5, 3)),
        Pair(colorId: 1, a: Point(2, 4), b: Point(3, 0)),
        Pair(colorId: 3, a: Point(4, 0), b: Point(6, 2)),
        Pair(colorId: 4, a: Point(4, 3), b: Point(2, 1)),
      ],
      solution: {
        2: [Point(5, 4), Point(4, 4), Point(3, 4), Point(3, 3), Point(2, 3), Point(1, 3), Point(1, 2), ],
        0: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(5, 3), ],
        1: [Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), ],
        3: [Point(4, 0), Point(5, 0), Point(6, 0), Point(6, 1), Point(6, 2), ],
        4: [Point(4, 3), Point(4, 2), Point(4, 1), Point(3, 1), Point(3, 2), Point(2, 2), Point(2, 1), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 0), b: Point(5, 4)),
        Pair(colorId: 2, a: Point(6, 5), b: Point(2, 3)),
        Pair(colorId: 1, a: Point(0, 1), b: Point(0, 5)),
        Pair(colorId: 3, a: Point(4, 5), b: Point(3, 2)),
        Pair(colorId: 4, a: Point(4, 2), b: Point(1, 3)),
      ],
      solution: {
        0: [Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), ],
        2: [Point(6, 5), Point(5, 5), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(2, 5), Point(2, 4), Point(2, 3), ],
        1: [Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        3: [Point(4, 5), Point(3, 5), Point(3, 4), Point(4, 4), Point(4, 3), Point(3, 3), Point(3, 2), ],
        4: [Point(4, 2), Point(4, 1), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 2), Point(1, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 2), b: Point(6, 1)),
        Pair(colorId: 1, a: Point(3, 3), b: Point(0, 5)),
        Pair(colorId: 3, a: Point(0, 2), b: Point(3, 0)),
        Pair(colorId: 4, a: Point(6, 0), b: Point(2, 1)),
        Pair(colorId: 2, a: Point(3, 4), b: Point(6, 3)),
      ],
      solution: {
        0: [Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), Point(5, 2), Point(6, 2), Point(6, 1), ],
        1: [Point(3, 3), Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), ],
        3: [Point(0, 2), Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), ],
        4: [Point(6, 0), Point(5, 0), Point(4, 0), Point(4, 1), Point(3, 1), Point(2, 1), ],
        2: [Point(3, 4), Point(4, 4), Point(5, 4), Point(6, 4), Point(6, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(6, 5), b: Point(0, 5)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(6, 0)),
        Pair(colorId: 0, a: Point(4, 3), b: Point(1, 2)),
        Pair(colorId: 3, a: Point(3, 2), b: Point(0, 3)),
        Pair(colorId: 4, a: Point(1, 1), b: Point(5, 1)),
      ],
      solution: {
        2: [Point(6, 5), Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), ],
        1: [Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), ],
        0: [Point(4, 3), Point(3, 3), Point(2, 3), Point(1, 3), Point(1, 2), ],
        3: [Point(3, 2), Point(4, 2), Point(5, 2), Point(5, 3), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), ],
        4: [Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 1), b: Point(6, 6)),
        Pair(colorId: 4, a: Point(6, 1), b: Point(2, 0)),
        Pair(colorId: 0, a: Point(4, 5), b: Point(1, 4)),
        Pair(colorId: 2, a: Point(2, 4), b: Point(4, 2)),
        Pair(colorId: 3, a: Point(3, 6), b: Point(3, 2)),
      ],
      solution: {
        1: [Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 2), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), ],
        4: [Point(6, 1), Point(6, 0), Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), ],
        0: [Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(1, 4), ],
        2: [Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
        3: [Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 0), b: Point(5, 1)),
        Pair(colorId: 3, a: Point(1, 0), b: Point(4, 3)),
        Pair(colorId: 4, a: Point(6, 3), b: Point(2, 5)),
        Pair(colorId: 0, a: Point(2, 3), b: Point(0, 6)),
        Pair(colorId: 2, a: Point(5, 4), b: Point(1, 5)),
      ],
      solution: {
        1: [Point(0, 0), Point(0, 1), Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), ],
        3: [Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(6, 1), Point(6, 2), Point(5, 2), Point(4, 2), Point(4, 3), ],
        4: [Point(6, 3), Point(6, 4), Point(6, 5), Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), ],
        0: [Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), ],
        2: [Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 2), b: Point(0, 5)),
        Pair(colorId: 3, a: Point(5, 1), b: Point(3, 6)),
        Pair(colorId: 4, a: Point(4, 4), b: Point(1, 6)),
        Pair(colorId: 0, a: Point(0, 2), b: Point(2, 0)),
        Pair(colorId: 1, a: Point(5, 5), b: Point(3, 3)),
      ],
      solution: {
        2: [Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), ],
        3: [Point(5, 1), Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), ],
        4: [Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 5), Point(1, 6), ],
        0: [Point(0, 2), Point(0, 1), Point(1, 1), Point(1, 0), Point(2, 0), ],
        1: [Point(5, 5), Point(5, 4), Point(5, 3), Point(4, 3), Point(3, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(5, 0), b: Point(5, 6)),
        Pair(colorId: 4, a: Point(1, 4), b: Point(3, 0)),
        Pair(colorId: 0, a: Point(3, 2), b: Point(4, 6)),
        Pair(colorId: 2, a: Point(1, 5), b: Point(0, 1)),
        Pair(colorId: 1, a: Point(3, 3), b: Point(2, 6)),
      ],
      solution: {
        3: [Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), Point(5, 6), ],
        4: [Point(1, 4), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), Point(3, 1), Point(3, 0), ],
        0: [Point(3, 2), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), Point(4, 6), ],
        2: [Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), ],
        1: [Point(3, 3), Point(3, 4), Point(3, 5), Point(2, 5), Point(2, 6), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 0), b: Point(1, 5)),
        Pair(colorId: 3, a: Point(5, 0), b: Point(4, 5)),
        Pair(colorId: 0, a: Point(3, 2), b: Point(4, 6)),
        Pair(colorId: 4, a: Point(0, 4), b: Point(2, 1)),
        Pair(colorId: 1, a: Point(5, 1), b: Point(6, 4)),
      ],
      solution: {
        2: [Point(2, 0), Point(1, 0), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), ],
        3: [Point(5, 0), Point(4, 0), Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), ],
        0: [Point(3, 2), Point(3, 3), Point(3, 4), Point(3, 5), Point(3, 6), Point(4, 6), ],
        4: [Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(2, 6), Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), ],
        1: [Point(5, 1), Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(1, 5), b: Point(4, 1)),
        Pair(colorId: 2, a: Point(2, 0), b: Point(6, 1)),
        Pair(colorId: 3, a: Point(6, 6), b: Point(3, 4)),
        Pair(colorId: 0, a: Point(3, 5), b: Point(0, 6)),
        Pair(colorId: 1, a: Point(6, 4), b: Point(4, 2)),
      ],
      solution: {
        4: [Point(1, 5), Point(2, 5), Point(2, 4), Point(2, 3), Point(3, 3), Point(3, 2), Point(3, 1), Point(4, 1), ],
        2: [Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(6, 1), ],
        3: [Point(6, 6), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), Point(4, 3), Point(4, 4), Point(3, 4), ],
        0: [Point(3, 5), Point(4, 5), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), ],
        1: [Point(6, 4), Point(6, 3), Point(6, 2), Point(5, 2), Point(4, 2), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(5, 0), b: Point(2, 4)),
        Pair(colorId: 1, a: Point(3, 3), b: Point(1, 0)),
        Pair(colorId: 2, a: Point(6, 1), b: Point(5, 5)),
        Pair(colorId: 3, a: Point(0, 0), b: Point(0, 5)),
        Pair(colorId: 4, a: Point(3, 6), b: Point(6, 5)),
      ],
      solution: {
        0: [Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(2, 1), Point(2, 2), Point(2, 3), Point(2, 4), ],
        1: [Point(3, 3), Point(3, 4), Point(3, 5), Point(2, 5), Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), Point(1, 0), ],
        2: [Point(6, 1), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), ],
        3: [Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        4: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(3, 6), b: Point(6, 0)),
        Pair(colorId: 0, a: Point(3, 2), b: Point(0, 5)),
        Pair(colorId: 2, a: Point(4, 0), b: Point(5, 3)),
        Pair(colorId: 3, a: Point(1, 2), b: Point(4, 1)),
        Pair(colorId: 4, a: Point(4, 4), b: Point(2, 6)),
      ],
      solution: {
        1: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), ],
        0: [Point(3, 2), Point(2, 2), Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), ],
        2: [Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), ],
        3: [Point(1, 2), Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), ],
        4: [Point(4, 4), Point(3, 4), Point(2, 4), Point(2, 5), Point(2, 6), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 1), b: Point(0, 5)),
        Pair(colorId: 0, a: Point(3, 2), b: Point(1, 5)),
        Pair(colorId: 3, a: Point(6, 6), b: Point(1, 6)),
        Pair(colorId: 1, a: Point(2, 4), b: Point(4, 2)),
        Pair(colorId: 4, a: Point(5, 2), b: Point(4, 5)),
      ],
      solution: {
        2: [Point(4, 1), Point(3, 1), Point(2, 1), Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        0: [Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), ],
        3: [Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), ],
        1: [Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
        4: [Point(5, 2), Point(6, 2), Point(6, 3), Point(5, 3), Point(5, 4), Point(6, 4), Point(6, 5), Point(5, 5), Point(4, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(1, 5), b: Point(3, 1)),
        Pair(colorId: 2, a: Point(5, 3), b: Point(3, 6)),
        Pair(colorId: 3, a: Point(5, 1), b: Point(6, 5)),
        Pair(colorId: 4, a: Point(0, 3), b: Point(2, 6)),
        Pair(colorId: 0, a: Point(3, 0), b: Point(4, 3)),
      ],
      solution: {
        1: [Point(1, 5), Point(2, 5), Point(3, 5), Point(3, 4), Point(3, 3), Point(3, 2), Point(3, 1), ],
        2: [Point(5, 3), Point(5, 4), Point(4, 4), Point(4, 5), Point(4, 6), Point(3, 6), ],
        3: [Point(5, 1), Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), ],
        4: [Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(2, 6), ],
        0: [Point(3, 0), Point(4, 0), Point(4, 1), Point(4, 2), Point(4, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 2), b: Point(3, 6)),
        Pair(colorId: 3, a: Point(5, 4), b: Point(1, 5)),
        Pair(colorId: 0, a: Point(0, 3), b: Point(1, 0)),
        Pair(colorId: 2, a: Point(3, 5), b: Point(6, 4)),
        Pair(colorId: 4, a: Point(6, 3), b: Point(4, 1)),
      ],
      solution: {
        1: [Point(2, 2), Point(2, 3), Point(2, 4), Point(2, 5), Point(2, 6), Point(3, 6), ],
        3: [Point(5, 4), Point(4, 4), Point(3, 4), Point(3, 3), Point(3, 2), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), ],
        0: [Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), ],
        2: [Point(3, 5), Point(4, 5), Point(5, 5), Point(6, 5), Point(6, 4), ],
        4: [Point(6, 3), Point(6, 2), Point(5, 2), Point(5, 1), Point(6, 1), Point(6, 0), Point(5, 0), Point(4, 0), Point(4, 1), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(0, 2), b: Point(1, 5)),
        Pair(colorId: 1, a: Point(2, 6), b: Point(0, 4)),
        Pair(colorId: 2, a: Point(5, 3), b: Point(6, 6)),
        Pair(colorId: 3, a: Point(6, 1), b: Point(3, 0)),
        Pair(colorId: 4, a: Point(2, 5), b: Point(1, 2)),
      ],
      solution: {
        0: [Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 4), Point(1, 5), ],
        1: [Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(0, 4), ],
        2: [Point(5, 3), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), ],
        3: [Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(3, 0), ],
        4: [Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), Point(1, 2), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(0, 0), b: Point(2, 6)),
        Pair(colorId: 0, a: Point(1, 0), b: Point(6, 0)),
        Pair(colorId: 1, a: Point(6, 2), b: Point(2, 1)),
        Pair(colorId: 2, a: Point(2, 2), b: Point(5, 3)),
        Pair(colorId: 4, a: Point(4, 6), b: Point(2, 4)),
      ],
      solution: {
        3: [Point(0, 0), Point(0, 1), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), Point(2, 5), Point(2, 6), ],
        0: [Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), ],
        1: [Point(6, 2), Point(5, 2), Point(4, 2), Point(3, 2), Point(3, 1), Point(2, 1), ],
        2: [Point(2, 2), Point(2, 3), Point(3, 3), Point(4, 3), Point(5, 3), ],
        4: [Point(4, 6), Point(3, 6), Point(3, 5), Point(4, 5), Point(5, 5), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(0, 6), b: Point(6, 1)),
        Pair(colorId: 2, a: Point(5, 5), b: Point(3, 1)),
        Pair(colorId: 1, a: Point(0, 2), b: Point(4, 1)),
        Pair(colorId: 0, a: Point(5, 1), b: Point(4, 4)),
        Pair(colorId: 4, a: Point(2, 2), b: Point(0, 4)),
      ],
      solution: {
        3: [Point(0, 6), Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), ],
        2: [Point(5, 5), Point(4, 5), Point(3, 5), Point(3, 4), Point(3, 3), Point(3, 2), Point(3, 1), ],
        1: [Point(0, 2), Point(1, 2), Point(1, 1), Point(2, 1), Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), ],
        0: [Point(5, 1), Point(5, 2), Point(4, 2), Point(4, 3), Point(4, 4), ],
        4: [Point(2, 2), Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 0), b: Point(6, 3)),
        Pair(colorId: 1, a: Point(0, 1), b: Point(3, 4)),
        Pair(colorId: 2, a: Point(2, 1), b: Point(1, 5)),
        Pair(colorId: 3, a: Point(2, 3), b: Point(0, 5)),
        Pair(colorId: 4, a: Point(4, 5), b: Point(1, 4)),
      ],
      solution: {
        0: [Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(6, 1), Point(6, 2), Point(6, 3), ],
        1: [Point(0, 1), Point(1, 1), Point(1, 2), Point(2, 2), Point(3, 2), Point(3, 3), Point(3, 4), ],
        2: [Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(1, 5), ],
        3: [Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), ],
        4: [Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 4), Point(1, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(4, 2), b: Point(2, 6)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(6, 3)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(5, 0)),
        Pair(colorId: 2, a: Point(6, 2), b: Point(3, 1)),
        Pair(colorId: 3, a: Point(1, 5), b: Point(1, 1)),
      ],
      solution: {
        4: [Point(4, 2), Point(3, 2), Point(2, 2), Point(2, 3), Point(2, 4), Point(2, 5), Point(2, 6), ],
        0: [Point(3, 4), Point(4, 4), Point(5, 4), Point(5, 5), Point(4, 5), Point(3, 5), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), ],
        1: [Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), ],
        2: [Point(6, 2), Point(5, 2), Point(5, 1), Point(4, 1), Point(3, 1), ],
        3: [Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(3, 0), b: Point(0, 4)),
        Pair(colorId: 2, a: Point(4, 5), b: Point(5, 0)),
        Pair(colorId: 4, a: Point(5, 3), b: Point(2, 5)),
        Pair(colorId: 0, a: Point(4, 3), b: Point(1, 2)),
        Pair(colorId: 3, a: Point(2, 6), b: Point(2, 2)),
      ],
      solution: {
        1: [Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), ],
        2: [Point(4, 5), Point(5, 5), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), Point(5, 2), Point(5, 1), Point(5, 0), ],
        4: [Point(5, 3), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(2, 5), ],
        0: [Point(4, 3), Point(3, 3), Point(3, 2), Point(4, 2), Point(4, 1), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 2), ],
        3: [Point(2, 6), Point(1, 6), Point(1, 5), Point(1, 4), Point(1, 3), Point(2, 3), Point(2, 2), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(6, 6), b: Point(3, 2)),
        Pair(colorId: 0, a: Point(6, 0), b: Point(1, 0)),
        Pair(colorId: 1, a: Point(0, 6), b: Point(0, 2)),
        Pair(colorId: 2, a: Point(4, 5), b: Point(1, 4)),
        Pair(colorId: 4, a: Point(3, 4), b: Point(6, 3)),
      ],
      solution: {
        3: [Point(6, 6), Point(5, 6), Point(5, 5), Point(5, 4), Point(4, 4), Point(4, 3), Point(3, 3), Point(3, 2), ],
        0: [Point(6, 0), Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), ],
        1: [Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), ],
        2: [Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(1, 4), ],
        4: [Point(3, 4), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(6, 1), Point(6, 2), Point(6, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 4), b: Point(1, 0)),
        Pair(colorId: 2, a: Point(3, 6), b: Point(6, 4)),
        Pair(colorId: 0, a: Point(5, 3), b: Point(4, 0)),
        Pair(colorId: 3, a: Point(2, 5), b: Point(4, 3)),
        Pair(colorId: 4, a: Point(1, 1), b: Point(1, 5)),
      ],
      solution: {
        1: [Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), Point(2, 0), Point(1, 0), ],
        2: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), ],
        0: [Point(5, 3), Point(5, 2), Point(4, 2), Point(4, 1), Point(4, 0), ],
        3: [Point(2, 5), Point(3, 5), Point(4, 5), Point(4, 4), Point(4, 3), ],
        4: [Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(1, 3), Point(1, 4), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(1, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(6, 4), b: Point(0, 5)),
        Pair(colorId: 1, a: Point(5, 3), b: Point(2, 1)),
        Pair(colorId: 0, a: Point(6, 1), b: Point(3, 0)),
        Pair(colorId: 2, a: Point(2, 4), b: Point(0, 6)),
        Pair(colorId: 4, a: Point(1, 5), b: Point(3, 3)),
      ],
      solution: {
        3: [Point(6, 4), Point(5, 4), Point(4, 4), Point(4, 3), Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        1: [Point(5, 3), Point(5, 2), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), ],
        0: [Point(6, 1), Point(6, 0), Point(5, 0), Point(4, 0), Point(3, 0), ],
        2: [Point(2, 4), Point(2, 5), Point(2, 6), Point(1, 6), Point(0, 6), ],
        4: [Point(1, 5), Point(1, 4), Point(1, 3), Point(2, 3), Point(3, 3), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(6, 6), b: Point(5, 1)),
        Pair(colorId: 4, a: Point(1, 6), b: Point(5, 4)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(1, 2)),
        Pair(colorId: 1, a: Point(5, 3), b: Point(2, 2)),
        Pair(colorId: 3, a: Point(2, 1), b: Point(5, 2)),
        Pair(colorId: 5, a: Point(1, 5), b: Point(0, 2)),
      ],
      solution: {
        2: [Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), Point(5, 1), ],
        4: [Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(5, 5), Point(5, 4), ],
        0: [Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 3), Point(1, 2), ],
        1: [Point(5, 3), Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 2), ],
        3: [Point(2, 1), Point(3, 1), Point(4, 1), Point(4, 2), Point(5, 2), ],
        5: [Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(5, 4), b: Point(3, 1)),
        Pair(colorId: 1, a: Point(1, 6), b: Point(4, 4)),
        Pair(colorId: 2, a: Point(1, 5), b: Point(1, 1)),
        Pair(colorId: 3, a: Point(1, 2), b: Point(4, 3)),
        Pair(colorId: 4, a: Point(6, 3), b: Point(4, 5)),
      ],
      solution: {
        0: [Point(5, 4), Point(5, 3), Point(5, 2), Point(4, 2), Point(3, 2), Point(3, 1), ],
        1: [Point(1, 6), Point(2, 6), Point(2, 5), Point(3, 5), Point(3, 4), Point(4, 4), ],
        2: [Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(1, 1), ],
        3: [Point(1, 2), Point(2, 2), Point(2, 3), Point(3, 3), Point(4, 3), ],
        4: [Point(6, 3), Point(6, 4), Point(6, 5), Point(5, 5), Point(4, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(5, 2), b: Point(1, 1)),
        Pair(colorId: 1, a: Point(5, 6), b: Point(1, 5)),
        Pair(colorId: 2, a: Point(6, 4), b: Point(1, 4)),
        Pair(colorId: 3, a: Point(0, 1), b: Point(4, 0)),
        Pair(colorId: 4, a: Point(2, 5), b: Point(6, 5)),
      ],
      solution: {
        0: [Point(5, 2), Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 1), ],
        1: [Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(1, 5), ],
        2: [Point(6, 4), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), ],
        3: [Point(0, 1), Point(0, 2), Point(0, 3), Point(1, 3), Point(2, 3), Point(3, 3), Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), Point(5, 0), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), Point(2, 0), Point(3, 0), Point(4, 0), ],
        4: [Point(2, 5), Point(3, 5), Point(4, 5), Point(5, 5), Point(6, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(4, 0), b: Point(0, 2)),
        Pair(colorId: 1, a: Point(0, 4), b: Point(3, 6)),
        Pair(colorId: 2, a: Point(6, 4), b: Point(2, 5)),
        Pair(colorId: 3, a: Point(6, 5), b: Point(4, 2)),
        Pair(colorId: 0, a: Point(2, 2), b: Point(3, 5)),
      ],
      solution: {
        4: [Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), ],
        1: [Point(0, 4), Point(1, 4), Point(1, 5), Point(1, 6), Point(2, 6), Point(3, 6), ],
        2: [Point(6, 4), Point(6, 3), Point(5, 3), Point(5, 2), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 2), Point(1, 3), Point(2, 3), Point(2, 4), Point(2, 5), ],
        3: [Point(6, 5), Point(5, 5), Point(4, 5), Point(4, 4), Point(4, 3), Point(4, 2), ],
        0: [Point(2, 2), Point(3, 2), Point(3, 3), Point(3, 4), Point(3, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(5, 4), b: Point(6, 0)),
        Pair(colorId: 4, a: Point(6, 5), b: Point(2, 4)),
        Pair(colorId: 0, a: Point(1, 6), b: Point(5, 6)),
        Pair(colorId: 1, a: Point(3, 3), b: Point(2, 0)),
        Pair(colorId: 3, a: Point(5, 1), b: Point(4, 4)),
      ],
      solution: {
        2: [Point(5, 4), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), ],
        4: [Point(6, 5), Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 4), ],
        0: [Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), ],
        1: [Point(3, 3), Point(2, 3), Point(2, 2), Point(2, 1), Point(2, 0), ],
        3: [Point(5, 1), Point(5, 0), Point(4, 0), Point(3, 0), Point(3, 1), Point(3, 2), Point(4, 2), Point(5, 2), Point(5, 3), Point(4, 3), Point(4, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(0, 0), b: Point(6, 6)),
        Pair(colorId: 4, a: Point(5, 1), b: Point(3, 5)),
        Pair(colorId: 0, a: Point(5, 3), b: Point(2, 5)),
        Pair(colorId: 1, a: Point(2, 3), b: Point(1, 6)),
        Pair(colorId: 2, a: Point(3, 3), b: Point(0, 4)),
      ],
      solution: {
        3: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), ],
        4: [Point(5, 1), Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), Point(3, 4), Point(3, 5), ],
        0: [Point(5, 3), Point(5, 4), Point(5, 5), Point(4, 5), Point(4, 6), Point(3, 6), Point(2, 6), Point(2, 5), ],
        1: [Point(2, 3), Point(1, 3), Point(1, 4), Point(1, 5), Point(1, 6), ],
        2: [Point(3, 3), Point(3, 2), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(1, 1), b: Point(6, 6)),
        Pair(colorId: 0, a: Point(2, 4), b: Point(5, 0)),
        Pair(colorId: 1, a: Point(1, 5), b: Point(3, 3)),
        Pair(colorId: 2, a: Point(0, 6), b: Point(1, 3)),
        Pair(colorId: 3, a: Point(6, 0), b: Point(6, 4)),
      ],
      solution: {
        4: [Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), Point(6, 5), Point(6, 6), ],
        0: [Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), ],
        1: [Point(1, 5), Point(2, 5), Point(3, 5), Point(3, 4), Point(3, 3), ],
        2: [Point(0, 6), Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), Point(4, 4), Point(4, 3), Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), ],
        3: [Point(6, 0), Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 5), b: Point(4, 1)),
        Pair(colorId: 4, a: Point(2, 1), b: Point(4, 6)),
        Pair(colorId: 2, a: Point(2, 4), b: Point(6, 6)),
        Pair(colorId: 1, a: Point(4, 0), b: Point(1, 1)),
        Pair(colorId: 3, a: Point(5, 0), b: Point(4, 3)),
        Pair(colorId: 5, a: Point(3, 4), b: Point(6, 5)),
      ],
      solution: {
        0: [Point(1, 5), Point(1, 4), Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), Point(4, 2), Point(4, 1), ],
        4: [Point(2, 1), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), ],
        2: [Point(2, 4), Point(2, 5), Point(3, 5), Point(4, 5), Point(5, 5), Point(5, 6), Point(6, 6), ],
        1: [Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), ],
        3: [Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(4, 3), ],
        5: [Point(3, 4), Point(4, 4), Point(5, 4), Point(6, 4), Point(6, 5), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 1), b: Point(5, 0)),
        Pair(colorId: 1, a: Point(0, 4), b: Point(3, 6)),
        Pair(colorId: 2, a: Point(0, 0), b: Point(1, 3)),
        Pair(colorId: 3, a: Point(5, 6), b: Point(4, 3)),
        Pair(colorId: 4, a: Point(5, 1), b: Point(6, 4)),
      ],
      solution: {
        0: [Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(4, 0), Point(5, 0), ],
        1: [Point(0, 4), Point(1, 4), Point(2, 4), Point(3, 4), Point(3, 5), Point(3, 6), ],
        2: [Point(0, 0), Point(0, 1), Point(0, 2), Point(1, 2), Point(1, 3), ],
        3: [Point(5, 6), Point(5, 5), Point(4, 5), Point(4, 4), Point(5, 4), Point(5, 3), Point(4, 3), ],
        4: [Point(5, 1), Point(5, 2), Point(6, 2), Point(6, 3), Point(6, 4), ],
      },
    ),
    Level(
      size: 7,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 6), b: Point(0, 1)),
        Pair(colorId: 4, a: Point(5, 5), b: Point(6, 0)),
        Pair(colorId: 3, a: Point(6, 4), b: Point(4, 1)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(2, 1)),
        Pair(colorId: 1, a: Point(3, 2), b: Point(5, 0)),
      ],
      solution: {
        2: [Point(1, 6), Point(1, 5), Point(0, 5), Point(0, 4), Point(1, 4), Point(1, 3), Point(0, 3), Point(0, 2), Point(1, 2), Point(1, 1), Point(0, 1), ],
        4: [Point(5, 5), Point(5, 4), Point(5, 3), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), ],
        3: [Point(6, 4), Point(6, 5), Point(6, 6), Point(5, 6), Point(4, 6), Point(4, 5), Point(4, 4), Point(4, 3), Point(4, 2), Point(4, 1), ],
        0: [Point(3, 4), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), ],
        1: [Point(3, 2), Point(3, 1), Point(3, 0), Point(4, 0), Point(5, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(4, 1), b: Point(0, 5)),
        Pair(colorId: 4, a: Point(5, 6), b: Point(6, 1)),
        Pair(colorId: 0, a: Point(7, 7), b: Point(4, 5)),
        Pair(colorId: 1, a: Point(2, 1), b: Point(5, 3)),
        Pair(colorId: 2, a: Point(6, 0), b: Point(7, 4)),
        Pair(colorId: 5, a: Point(1, 6), b: Point(4, 4)),
        Pair(colorId: 6, a: Point(1, 0), b: Point(0, 4)),
      ],
      solution: {
        3: [Point(4, 1), Point(3, 1), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), Point(0, 5), ],
        4: [Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), ],
        0: [Point(7, 7), Point(6, 7), Point(5, 7), Point(4, 7), Point(4, 6), Point(4, 5), ],
        1: [Point(2, 1), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), ],
        2: [Point(6, 0), Point(7, 0), Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), ],
        5: [Point(1, 6), Point(2, 6), Point(3, 6), Point(3, 5), Point(3, 4), Point(4, 4), ],
        6: [Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(7, 7), b: Point(0, 6)),
        Pair(colorId: 4, a: Point(1, 4), b: Point(6, 2)),
        Pair(colorId: 5, a: Point(6, 0), b: Point(4, 5)),
        Pair(colorId: 2, a: Point(1, 3), b: Point(5, 1)),
        Pair(colorId: 0, a: Point(0, 2), b: Point(4, 1)),
        Pair(colorId: 3, a: Point(5, 7), b: Point(0, 7)),
      ],
      solution: {
        1: [Point(7, 7), Point(6, 7), Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), ],
        4: [Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), Point(5, 4), Point(6, 4), Point(6, 3), Point(6, 2), ],
        5: [Point(6, 0), Point(7, 0), Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(6, 5), Point(5, 5), Point(4, 5), ],
        2: [Point(1, 3), Point(2, 3), Point(3, 3), Point(4, 3), Point(5, 3), Point(5, 2), Point(5, 1), ],
        0: [Point(0, 2), Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), Point(4, 1), ],
        3: [Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), Point(0, 7), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 5, a: Point(7, 7), b: Point(5, 2)),
        Pair(colorId: 0, a: Point(6, 1), b: Point(3, 4)),
        Pair(colorId: 1, a: Point(1, 2), b: Point(3, 5)),
        Pair(colorId: 2, a: Point(2, 2), b: Point(3, 6)),
        Pair(colorId: 3, a: Point(1, 7), b: Point(5, 6)),
        Pair(colorId: 4, a: Point(5, 1), b: Point(4, 5)),
      ],
      solution: {
        5: [Point(7, 7), Point(6, 7), Point(6, 6), Point(6, 5), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), ],
        0: [Point(6, 1), Point(6, 0), Point(5, 0), Point(4, 0), Point(3, 0), Point(3, 1), Point(3, 2), Point(3, 3), Point(3, 4), ],
        1: [Point(1, 2), Point(1, 3), Point(2, 3), Point(2, 4), Point(2, 5), Point(3, 5), ],
        2: [Point(2, 2), Point(2, 1), Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(1, 5), Point(1, 6), Point(2, 6), Point(3, 6), ],
        3: [Point(1, 7), Point(2, 7), Point(3, 7), Point(4, 7), Point(4, 6), Point(5, 6), ],
        4: [Point(5, 1), Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(1, 1), b: Point(7, 0)),
        Pair(colorId: 5, a: Point(1, 2), b: Point(5, 5)),
        Pair(colorId: 2, a: Point(7, 6), b: Point(2, 7)),
        Pair(colorId: 3, a: Point(5, 6), b: Point(0, 5)),
        Pair(colorId: 0, a: Point(4, 3), b: Point(7, 5)),
        Pair(colorId: 1, a: Point(7, 4), b: Point(4, 2)),
      ],
      solution: {
        4: [Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(6, 1), Point(7, 1), Point(7, 0), ],
        5: [Point(1, 2), Point(2, 2), Point(3, 2), Point(3, 3), Point(3, 4), Point(4, 4), Point(5, 4), Point(5, 5), ],
        2: [Point(7, 6), Point(6, 6), Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), ],
        3: [Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), ],
        0: [Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 4), Point(6, 5), Point(7, 5), ],
        1: [Point(7, 4), Point(7, 3), Point(7, 2), Point(6, 2), Point(5, 2), Point(4, 2), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(7, 0), b: Point(1, 5)),
        Pair(colorId: 0, a: Point(7, 7), b: Point(3, 4)),
        Pair(colorId: 1, a: Point(5, 1), b: Point(7, 6)),
        Pair(colorId: 3, a: Point(0, 1), b: Point(2, 6)),
        Pair(colorId: 4, a: Point(3, 5), b: Point(0, 7)),
        Pair(colorId: 5, a: Point(3, 1), b: Point(6, 3)),
      ],
      solution: {
        2: [Point(7, 0), Point(6, 0), Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), ],
        0: [Point(7, 7), Point(6, 7), Point(5, 7), Point(4, 7), Point(4, 6), Point(4, 5), Point(4, 4), Point(3, 4), ],
        1: [Point(5, 1), Point(6, 1), Point(6, 2), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(7, 6), ],
        3: [Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(2, 6), ],
        4: [Point(3, 5), Point(3, 6), Point(3, 7), Point(2, 7), Point(1, 7), Point(0, 7), ],
        5: [Point(3, 1), Point(4, 1), Point(4, 2), Point(5, 2), Point(5, 3), Point(6, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 7), b: Point(7, 5)),
        Pair(colorId: 3, a: Point(3, 6), b: Point(7, 4)),
        Pair(colorId: 4, a: Point(2, 6), b: Point(1, 1)),
        Pair(colorId: 0, a: Point(3, 5), b: Point(1, 2)),
        Pair(colorId: 1, a: Point(2, 3), b: Point(0, 0)),
        Pair(colorId: 5, a: Point(3, 2), b: Point(7, 1)),
      ],
      solution: {
        2: [Point(2, 7), Point(3, 7), Point(4, 7), Point(5, 7), Point(6, 7), Point(7, 7), Point(7, 6), Point(7, 5), ],
        3: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(5, 3), Point(5, 4), Point(4, 4), Point(4, 3), Point(4, 2), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 3), Point(7, 4), ],
        4: [Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(1, 1), ],
        0: [Point(3, 5), Point(3, 4), Point(2, 4), Point(2, 5), Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), ],
        1: [Point(2, 3), Point(2, 2), Point(2, 1), Point(2, 0), Point(1, 0), Point(0, 0), ],
        5: [Point(3, 2), Point(3, 1), Point(4, 1), Point(5, 1), Point(6, 1), Point(7, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(4, 6), b: Point(1, 1)),
        Pair(colorId: 0, a: Point(0, 0), b: Point(0, 7)),
        Pair(colorId: 1, a: Point(2, 1), b: Point(6, 3)),
        Pair(colorId: 2, a: Point(4, 1), b: Point(7, 3)),
        Pair(colorId: 3, a: Point(7, 6), b: Point(2, 6)),
        Pair(colorId: 5, a: Point(6, 4), b: Point(2, 3)),
      ],
      solution: {
        4: [Point(4, 6), Point(3, 6), Point(3, 5), Point(2, 5), Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), ],
        0: [Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(0, 7), ],
        1: [Point(2, 1), Point(3, 1), Point(3, 2), Point(4, 2), Point(5, 2), Point(6, 2), Point(6, 3), ],
        2: [Point(4, 1), Point(5, 1), Point(6, 1), Point(7, 1), Point(7, 2), Point(7, 3), ],
        3: [Point(7, 6), Point(6, 6), Point(5, 6), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(2, 6), ],
        5: [Point(6, 4), Point(7, 4), Point(7, 5), Point(6, 5), Point(5, 5), Point(5, 4), Point(4, 4), Point(4, 3), Point(3, 3), Point(3, 4), Point(2, 4), Point(2, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(6, 4), b: Point(1, 2)),
        Pair(colorId: 0, a: Point(4, 3), b: Point(0, 2)),
        Pair(colorId: 1, a: Point(7, 5), b: Point(6, 1)),
        Pair(colorId: 2, a: Point(7, 6), b: Point(2, 6)),
        Pair(colorId: 3, a: Point(3, 1), b: Point(7, 2)),
        Pair(colorId: 5, a: Point(4, 5), b: Point(0, 6)),
      ],
      solution: {
        4: [Point(6, 4), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 3), Point(1, 2), ],
        0: [Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 2), Point(2, 1), Point(1, 1), Point(0, 1), Point(0, 2), ],
        1: [Point(7, 5), Point(7, 4), Point(7, 3), Point(6, 3), Point(6, 2), Point(6, 1), ],
        2: [Point(7, 6), Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), ],
        3: [Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 0), Point(6, 0), Point(7, 0), Point(7, 1), Point(7, 2), ],
        5: [Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 6), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(4, 1), b: Point(1, 5)),
        Pair(colorId: 2, a: Point(2, 7), b: Point(7, 5)),
        Pair(colorId: 4, a: Point(4, 4), b: Point(6, 0)),
        Pair(colorId: 0, a: Point(3, 0), b: Point(0, 2)),
        Pair(colorId: 3, a: Point(3, 3), b: Point(6, 1)),
        Pair(colorId: 5, a: Point(2, 6), b: Point(3, 2)),
      ],
      solution: {
        1: [Point(4, 1), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), ],
        2: [Point(2, 7), Point(3, 7), Point(4, 7), Point(5, 7), Point(6, 7), Point(7, 7), Point(7, 6), Point(7, 5), ],
        4: [Point(4, 4), Point(5, 4), Point(5, 5), Point(4, 5), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(7, 3), Point(7, 2), Point(7, 1), Point(7, 0), Point(6, 0), ],
        0: [Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), ],
        3: [Point(3, 3), Point(4, 3), Point(5, 3), Point(5, 2), Point(6, 2), Point(6, 1), ],
        5: [Point(2, 6), Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), Point(3, 2), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 5, a: Point(7, 6), b: Point(1, 3)),
        Pair(colorId: 3, a: Point(2, 0), b: Point(5, 5)),
        Pair(colorId: 0, a: Point(7, 0), b: Point(6, 5)),
        Pair(colorId: 1, a: Point(6, 7), b: Point(1, 6)),
        Pair(colorId: 2, a: Point(4, 4), b: Point(0, 2)),
        Pair(colorId: 4, a: Point(1, 0), b: Point(4, 3)),
      ],
      solution: {
        5: [Point(7, 6), Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(2, 5), Point(1, 5), Point(1, 4), Point(1, 3), ],
        3: [Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), ],
        0: [Point(7, 0), Point(6, 0), Point(6, 1), Point(7, 1), Point(7, 2), Point(6, 2), Point(6, 3), Point(6, 4), Point(7, 4), Point(7, 5), Point(6, 5), ],
        1: [Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), Point(1, 6), ],
        2: [Point(4, 4), Point(3, 4), Point(2, 4), Point(2, 3), Point(2, 2), Point(1, 2), Point(0, 2), ],
        4: [Point(1, 0), Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(4, 2), Point(4, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(7, 2), b: Point(2, 5)),
        Pair(colorId: 1, a: Point(1, 1), b: Point(0, 6)),
        Pair(colorId: 2, a: Point(7, 3), b: Point(4, 6)),
        Pair(colorId: 0, a: Point(4, 3), b: Point(7, 5)),
        Pair(colorId: 4, a: Point(7, 1), b: Point(2, 1)),
        Pair(colorId: 5, a: Point(7, 0), b: Point(2, 0)),
      ],
      solution: {
        3: [Point(7, 2), Point(6, 2), Point(5, 2), Point(4, 2), Point(3, 2), Point(2, 2), Point(2, 3), Point(2, 4), Point(2, 5), ],
        1: [Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), ],
        2: [Point(7, 3), Point(6, 3), Point(5, 3), Point(5, 4), Point(4, 4), Point(4, 5), Point(4, 6), ],
        0: [Point(4, 3), Point(3, 3), Point(3, 4), Point(3, 5), Point(3, 6), Point(3, 7), Point(4, 7), Point(5, 7), Point(6, 7), Point(7, 7), Point(7, 6), Point(7, 5), ],
        4: [Point(7, 1), Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), ],
        5: [Point(7, 0), Point(6, 0), Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 7), b: Point(0, 0)),
        Pair(colorId: 1, a: Point(5, 7), b: Point(6, 2)),
        Pair(colorId: 3, a: Point(7, 4), b: Point(4, 1)),
        Pair(colorId: 0, a: Point(1, 6), b: Point(2, 2)),
        Pair(colorId: 4, a: Point(2, 6), b: Point(4, 3)),
        Pair(colorId: 5, a: Point(2, 5), b: Point(1, 1)),
      ],
      solution: {
        2: [Point(2, 7), Point(1, 7), Point(0, 7), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        1: [Point(5, 7), Point(6, 7), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), ],
        3: [Point(7, 4), Point(7, 3), Point(7, 2), Point(7, 1), Point(6, 1), Point(5, 1), Point(4, 1), ],
        0: [Point(1, 6), Point(1, 5), Point(1, 4), Point(2, 4), Point(2, 3), Point(2, 2), ],
        4: [Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), Point(4, 4), Point(4, 3), ],
        5: [Point(2, 5), Point(3, 5), Point(3, 4), Point(3, 3), Point(3, 2), Point(3, 1), Point(2, 1), Point(1, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 5, a: Point(7, 7), b: Point(1, 4)),
        Pair(colorId: 2, a: Point(7, 0), b: Point(4, 5)),
        Pair(colorId: 3, a: Point(0, 5), b: Point(2, 0)),
        Pair(colorId: 1, a: Point(2, 6), b: Point(1, 1)),
        Pair(colorId: 0, a: Point(7, 4), b: Point(4, 6)),
        Pair(colorId: 4, a: Point(3, 5), b: Point(2, 1)),
      ],
      solution: {
        5: [Point(7, 7), Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), Point(1, 6), Point(1, 5), Point(1, 4), ],
        2: [Point(7, 0), Point(6, 0), Point(5, 0), Point(4, 0), Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), ],
        3: [Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), ],
        1: [Point(2, 6), Point(2, 5), Point(2, 4), Point(2, 3), Point(1, 3), Point(1, 2), Point(1, 1), ],
        0: [Point(7, 4), Point(6, 4), Point(6, 3), Point(7, 3), Point(7, 2), Point(6, 2), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), Point(6, 5), Point(7, 5), Point(7, 6), Point(6, 6), Point(5, 6), Point(4, 6), ],
        4: [Point(3, 5), Point(3, 4), Point(3, 3), Point(3, 2), Point(2, 2), Point(2, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(5, 0), b: Point(0, 3)),
        Pair(colorId: 1, a: Point(3, 2), b: Point(7, 6)),
        Pair(colorId: 2, a: Point(1, 6), b: Point(7, 7)),
        Pair(colorId: 3, a: Point(2, 1), b: Point(7, 1)),
        Pair(colorId: 4, a: Point(3, 5), b: Point(0, 7)),
        Pair(colorId: 5, a: Point(1, 4), b: Point(6, 4)),
      ],
      solution: {
        0: [Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), ],
        1: [Point(3, 2), Point(4, 2), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(7, 6), ],
        2: [Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(6, 7), Point(7, 7), ],
        3: [Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(6, 1), Point(6, 0), Point(7, 0), Point(7, 1), ],
        4: [Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 6), Point(0, 7), ],
        5: [Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), Point(5, 4), Point(6, 4), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(6, 7), b: Point(0, 6)),
        Pair(colorId: 2, a: Point(1, 1), b: Point(3, 5)),
        Pair(colorId: 0, a: Point(7, 3), b: Point(2, 3)),
        Pair(colorId: 1, a: Point(3, 2), b: Point(7, 1)),
        Pair(colorId: 3, a: Point(0, 3), b: Point(4, 4)),
        Pair(colorId: 5, a: Point(3, 1), b: Point(7, 0)),
      ],
      solution: {
        4: [Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), Point(0, 7), Point(0, 6), ],
        2: [Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(2, 4), Point(3, 4), Point(3, 5), ],
        0: [Point(7, 3), Point(6, 3), Point(5, 3), Point(4, 3), Point(3, 3), Point(2, 3), ],
        1: [Point(3, 2), Point(4, 2), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 1), ],
        3: [Point(0, 3), Point(0, 4), Point(0, 5), Point(1, 5), Point(2, 5), Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), Point(4, 4), ],
        5: [Point(3, 1), Point(2, 1), Point(2, 0), Point(3, 0), Point(4, 0), Point(4, 1), Point(5, 1), Point(5, 0), Point(6, 0), Point(7, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(6, 2), b: Point(3, 5)),
        Pair(colorId: 4, a: Point(7, 4), b: Point(3, 2)),
        Pair(colorId: 1, a: Point(6, 3), b: Point(7, 7)),
        Pair(colorId: 2, a: Point(2, 1), b: Point(6, 0)),
        Pair(colorId: 3, a: Point(0, 2), b: Point(1, 6)),
        Pair(colorId: 5, a: Point(3, 4), b: Point(1, 7)),
      ],
      solution: {
        0: [Point(6, 2), Point(5, 2), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), Point(3, 5), ],
        4: [Point(7, 4), Point(7, 3), Point(7, 2), Point(7, 1), Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(3, 2), ],
        1: [Point(6, 3), Point(5, 3), Point(5, 4), Point(6, 4), Point(6, 5), Point(5, 5), Point(5, 6), Point(6, 6), Point(7, 6), Point(7, 7), ],
        2: [Point(2, 1), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), ],
        3: [Point(0, 2), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), Point(1, 6), ],
        5: [Point(3, 4), Point(3, 3), Point(2, 3), Point(2, 4), Point(2, 5), Point(2, 6), Point(2, 7), Point(1, 7), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(5, 2), b: Point(0, 6)),
        Pair(colorId: 0, a: Point(0, 2), b: Point(5, 0)),
        Pair(colorId: 1, a: Point(4, 6), b: Point(7, 3)),
        Pair(colorId: 2, a: Point(4, 3), b: Point(1, 1)),
        Pair(colorId: 3, a: Point(3, 3), b: Point(4, 7)),
        Pair(colorId: 5, a: Point(6, 4), b: Point(3, 6)),
      ],
      solution: {
        4: [Point(5, 2), Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), ],
        0: [Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), ],
        1: [Point(4, 6), Point(5, 6), Point(6, 6), Point(7, 6), Point(7, 5), Point(7, 4), Point(7, 3), ],
        2: [Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 2), Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), Point(1, 1), ],
        3: [Point(3, 3), Point(2, 3), Point(2, 4), Point(2, 5), Point(2, 6), Point(2, 7), Point(3, 7), Point(4, 7), ],
        5: [Point(6, 4), Point(6, 5), Point(5, 5), Point(5, 4), Point(4, 4), Point(4, 5), Point(3, 5), Point(3, 6), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(0, 6), b: Point(0, 0)),
        Pair(colorId: 3, a: Point(4, 1), b: Point(4, 7)),
        Pair(colorId: 6, a: Point(2, 1), b: Point(1, 6)),
        Pair(colorId: 0, a: Point(3, 2), b: Point(2, 6)),
        Pair(colorId: 2, a: Point(5, 1), b: Point(6, 5)),
        Pair(colorId: 4, a: Point(6, 1), b: Point(7, 5)),
        Pair(colorId: 5, a: Point(3, 0), b: Point(1, 3)),
      ],
      solution: {
        1: [Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        3: [Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), Point(4, 6), Point(4, 7), ],
        6: [Point(2, 1), Point(2, 2), Point(2, 3), Point(2, 4), Point(1, 4), Point(1, 5), Point(1, 6), ],
        0: [Point(3, 2), Point(3, 3), Point(3, 4), Point(3, 5), Point(2, 5), Point(2, 6), ],
        2: [Point(5, 1), Point(5, 2), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), ],
        4: [Point(6, 1), Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), ],
        5: [Point(3, 0), Point(2, 0), Point(1, 0), Point(1, 1), Point(1, 2), Point(1, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 5), b: Point(1, 0)),
        Pair(colorId: 1, a: Point(2, 0), b: Point(4, 5)),
        Pair(colorId: 3, a: Point(7, 6), b: Point(6, 1)),
        Pair(colorId: 4, a: Point(5, 5), b: Point(4, 0)),
        Pair(colorId: 2, a: Point(2, 5), b: Point(0, 2)),
        Pair(colorId: 5, a: Point(3, 6), b: Point(7, 7)),
      ],
      solution: {
        0: [Point(3, 5), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), Point(1, 0), ],
        1: [Point(2, 0), Point(3, 0), Point(3, 1), Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), ],
        3: [Point(7, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), ],
        4: [Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), Point(5, 0), Point(4, 0), ],
        2: [Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), ],
        5: [Point(3, 6), Point(4, 6), Point(5, 6), Point(5, 7), Point(6, 7), Point(7, 7), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(3, 1), b: Point(7, 6)),
        Pair(colorId: 5, a: Point(4, 5), b: Point(0, 0)),
        Pair(colorId: 1, a: Point(4, 6), b: Point(0, 4)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(6, 6)),
        Pair(colorId: 2, a: Point(5, 4), b: Point(3, 7)),
        Pair(colorId: 3, a: Point(1, 0), b: Point(5, 1)),
      ],
      solution: {
        4: [Point(3, 1), Point(4, 1), Point(4, 2), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(7, 6), ],
        5: [Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(1, 4), Point(1, 3), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        1: [Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(0, 4), ],
        0: [Point(3, 4), Point(4, 4), Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), ],
        2: [Point(5, 4), Point(5, 5), Point(5, 6), Point(5, 7), Point(4, 7), Point(3, 7), ],
        3: [Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(1, 4), b: Point(6, 6)),
        Pair(colorId: 1, a: Point(6, 5), b: Point(2, 7)),
        Pair(colorId: 0, a: Point(4, 1), b: Point(3, 5)),
        Pair(colorId: 2, a: Point(2, 4), b: Point(3, 0)),
        Pair(colorId: 3, a: Point(1, 2), b: Point(1, 7)),
        Pair(colorId: 5, a: Point(5, 4), b: Point(7, 1)),
      ],
      solution: {
        4: [Point(1, 4), Point(1, 5), Point(2, 5), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), ],
        1: [Point(6, 5), Point(7, 5), Point(7, 6), Point(7, 7), Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), ],
        0: [Point(4, 1), Point(3, 1), Point(3, 2), Point(3, 3), Point(3, 4), Point(3, 5), ],
        2: [Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), Point(2, 0), Point(3, 0), ],
        3: [Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(1, 7), ],
        5: [Point(5, 4), Point(5, 5), Point(4, 5), Point(4, 4), Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 4), Point(7, 4), Point(7, 3), Point(7, 2), Point(6, 2), Point(5, 2), Point(5, 1), Point(5, 0), Point(6, 0), Point(6, 1), Point(7, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(6, 6), b: Point(0, 3)),
        Pair(colorId: 1, a: Point(1, 5), b: Point(4, 2)),
        Pair(colorId: 3, a: Point(3, 3), b: Point(6, 0)),
        Pair(colorId: 5, a: Point(4, 4), b: Point(1, 7)),
        Pair(colorId: 2, a: Point(0, 1), b: Point(4, 0)),
        Pair(colorId: 4, a: Point(5, 4), b: Point(7, 1)),
      ],
      solution: {
        0: [Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), ],
        1: [Point(1, 5), Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), Point(3, 2), Point(4, 2), ],
        3: [Point(3, 3), Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), ],
        5: [Point(4, 4), Point(4, 5), Point(5, 5), Point(6, 5), Point(7, 5), Point(7, 6), Point(7, 7), Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), ],
        2: [Point(0, 1), Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(4, 0), ],
        4: [Point(5, 4), Point(6, 4), Point(7, 4), Point(7, 3), Point(7, 2), Point(7, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(2, 0), b: Point(7, 2)),
        Pair(colorId: 0, a: Point(3, 1), b: Point(1, 5)),
        Pair(colorId: 1, a: Point(5, 5), b: Point(4, 1)),
        Pair(colorId: 2, a: Point(7, 3), b: Point(6, 7)),
        Pair(colorId: 3, a: Point(2, 5), b: Point(4, 2)),
        Pair(colorId: 5, a: Point(3, 7), b: Point(0, 5)),
      ],
      solution: {
        4: [Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(7, 0), Point(7, 1), Point(7, 2), ],
        0: [Point(3, 1), Point(3, 2), Point(2, 2), Point(2, 3), Point(1, 3), Point(1, 2), Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(1, 4), Point(1, 5), ],
        1: [Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), Point(4, 1), ],
        2: [Point(7, 3), Point(7, 4), Point(6, 4), Point(6, 5), Point(7, 5), Point(7, 6), Point(6, 6), Point(6, 7), ],
        3: [Point(2, 5), Point(3, 5), Point(4, 5), Point(4, 4), Point(3, 4), Point(3, 3), Point(4, 3), Point(4, 2), ],
        5: [Point(3, 7), Point(4, 7), Point(4, 6), Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(2, 6), b: Point(5, 3)),
        Pair(colorId: 5, a: Point(4, 5), b: Point(0, 7)),
        Pair(colorId: 0, a: Point(6, 5), b: Point(3, 7)),
        Pair(colorId: 1, a: Point(6, 4), b: Point(5, 0)),
        Pair(colorId: 2, a: Point(4, 2), b: Point(1, 0)),
        Pair(colorId: 4, a: Point(7, 2), b: Point(7, 7)),
      ],
      solution: {
        3: [Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), ],
        5: [Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 6), Point(0, 7), ],
        0: [Point(6, 5), Point(6, 6), Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), ],
        1: [Point(6, 4), Point(6, 3), Point(6, 2), Point(5, 2), Point(5, 1), Point(5, 0), ],
        2: [Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 1), Point(1, 0), ],
        4: [Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(7, 6), Point(7, 7), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(6, 1), b: Point(4, 7)),
        Pair(colorId: 1, a: Point(1, 1), b: Point(0, 7)),
        Pair(colorId: 0, a: Point(4, 3), b: Point(2, 6)),
        Pair(colorId: 3, a: Point(2, 3), b: Point(3, 7)),
        Pair(colorId: 4, a: Point(5, 0), b: Point(2, 2)),
        Pair(colorId: 5, a: Point(6, 7), b: Point(6, 2)),
      ],
      solution: {
        2: [Point(6, 1), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(4, 4), Point(4, 5), Point(4, 6), Point(4, 7), ],
        1: [Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(0, 7), ],
        0: [Point(4, 3), Point(3, 3), Point(3, 4), Point(2, 4), Point(2, 5), Point(2, 6), ],
        3: [Point(2, 3), Point(1, 3), Point(1, 4), Point(1, 5), Point(1, 6), Point(1, 7), Point(2, 7), Point(3, 7), ],
        4: [Point(5, 0), Point(4, 0), Point(4, 1), Point(3, 1), Point(2, 1), Point(2, 2), ],
        5: [Point(6, 7), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(1, 6), b: Point(7, 4)),
        Pair(colorId: 4, a: Point(2, 0), b: Point(2, 7)),
        Pair(colorId: 2, a: Point(1, 5), b: Point(6, 4)),
        Pair(colorId: 5, a: Point(7, 0), b: Point(5, 4)),
        Pair(colorId: 1, a: Point(1, 4), b: Point(4, 2)),
        Pair(colorId: 3, a: Point(5, 0), b: Point(1, 1)),
      ],
      solution: {
        0: [Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(7, 6), Point(7, 5), Point(7, 4), ],
        4: [Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(0, 7), Point(1, 7), Point(2, 7), ],
        2: [Point(1, 5), Point(2, 5), Point(3, 5), Point(4, 5), Point(5, 5), Point(6, 5), Point(6, 4), ],
        5: [Point(7, 0), Point(7, 1), Point(6, 1), Point(5, 1), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 3), Point(6, 3), Point(5, 3), Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 4), Point(3, 4), Point(4, 4), Point(5, 4), ],
        1: [Point(1, 4), Point(1, 3), Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), ],
        3: [Point(5, 0), Point(4, 0), Point(3, 0), Point(3, 1), Point(2, 1), Point(1, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(3, 0), b: Point(7, 4)),
        Pair(colorId: 1, a: Point(3, 7), b: Point(5, 3)),
        Pair(colorId: 0, a: Point(2, 1), b: Point(1, 5)),
        Pair(colorId: 2, a: Point(2, 7), b: Point(4, 4)),
        Pair(colorId: 3, a: Point(0, 0), b: Point(1, 4)),
        Pair(colorId: 5, a: Point(3, 4), b: Point(6, 2)),
      ],
      solution: {
        4: [Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(7, 0), Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), ],
        1: [Point(3, 7), Point(4, 7), Point(5, 7), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), ],
        0: [Point(2, 1), Point(2, 2), Point(2, 3), Point(2, 4), Point(2, 5), Point(1, 5), ],
        2: [Point(2, 7), Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), Point(4, 4), ],
        3: [Point(0, 0), Point(1, 0), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), ],
        5: [Point(3, 4), Point(3, 3), Point(4, 3), Point(4, 2), Point(5, 2), Point(6, 2), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 1), b: Point(2, 7)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(0, 5)),
        Pair(colorId: 2, a: Point(4, 5), b: Point(2, 2)),
        Pair(colorId: 3, a: Point(5, 7), b: Point(3, 4)),
        Pair(colorId: 4, a: Point(5, 4), b: Point(2, 6)),
        Pair(colorId: 5, a: Point(7, 2), b: Point(3, 3)),
      ],
      solution: {
        0: [Point(2, 1), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), Point(1, 6), Point(1, 7), Point(2, 7), ],
        1: [Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        2: [Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), ],
        3: [Point(5, 7), Point(6, 7), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(5, 3), Point(4, 3), Point(4, 4), Point(3, 4), ],
        4: [Point(5, 4), Point(5, 5), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), ],
        5: [Point(7, 2), Point(6, 2), Point(5, 2), Point(4, 2), Point(3, 2), Point(3, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(3, 3), b: Point(7, 7)),
        Pair(colorId: 1, a: Point(6, 5), b: Point(2, 2)),
        Pair(colorId: 2, a: Point(4, 7), b: Point(1, 3)),
        Pair(colorId: 0, a: Point(6, 1), b: Point(0, 1)),
        Pair(colorId: 5, a: Point(0, 6), b: Point(1, 1)),
        Pair(colorId: 4, a: Point(3, 1), b: Point(7, 0)),
      ],
      solution: {
        3: [Point(3, 3), Point(4, 3), Point(5, 3), Point(6, 3), Point(7, 3), Point(7, 4), Point(7, 5), Point(7, 6), Point(7, 7), ],
        1: [Point(6, 5), Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), ],
        2: [Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), Point(1, 6), Point(1, 5), Point(1, 4), Point(1, 3), ],
        0: [Point(6, 1), Point(5, 1), Point(4, 1), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), ],
        5: [Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(1, 2), Point(1, 1), ],
        4: [Point(3, 1), Point(3, 2), Point(4, 2), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 1), Point(7, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 7), b: Point(1, 0)),
        Pair(colorId: 0, a: Point(4, 7), b: Point(5, 1)),
        Pair(colorId: 5, a: Point(4, 0), b: Point(2, 4)),
        Pair(colorId: 1, a: Point(0, 0), b: Point(0, 5)),
        Pair(colorId: 3, a: Point(2, 6), b: Point(4, 3)),
        Pair(colorId: 4, a: Point(4, 1), b: Point(3, 5)),
      ],
      solution: {
        2: [Point(2, 7), Point(1, 7), Point(1, 6), Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), Point(1, 0), ],
        0: [Point(4, 7), Point(5, 7), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), ],
        5: [Point(4, 0), Point(3, 0), Point(2, 0), Point(2, 1), Point(2, 2), Point(2, 3), Point(2, 4), ],
        1: [Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        3: [Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 5), Point(4, 4), Point(4, 3), ],
        4: [Point(4, 1), Point(4, 2), Point(3, 2), Point(3, 3), Point(3, 4), Point(3, 5), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(4, 5), b: Point(1, 1)),
        Pair(colorId: 3, a: Point(2, 7), b: Point(4, 2)),
        Pair(colorId: 4, a: Point(2, 2), b: Point(7, 0)),
        Pair(colorId: 5, a: Point(5, 7), b: Point(4, 1)),
        Pair(colorId: 0, a: Point(0, 1), b: Point(2, 5)),
        Pair(colorId: 1, a: Point(7, 7), b: Point(7, 2)),
      ],
      solution: {
        2: [Point(4, 5), Point(3, 5), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), ],
        3: [Point(2, 7), Point(3, 7), Point(4, 7), Point(4, 6), Point(5, 6), Point(5, 5), Point(5, 4), Point(4, 4), Point(4, 3), Point(4, 2), ],
        4: [Point(2, 2), Point(3, 2), Point(3, 1), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(7, 0), ],
        5: [Point(5, 7), Point(6, 7), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(5, 3), Point(5, 2), Point(5, 1), Point(4, 1), ],
        0: [Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(0, 7), Point(1, 7), Point(1, 6), Point(1, 5), Point(2, 5), ],
        1: [Point(7, 7), Point(7, 6), Point(7, 5), Point(7, 4), Point(7, 3), Point(7, 2), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 5, a: Point(1, 1), b: Point(5, 4)),
        Pair(colorId: 0, a: Point(5, 5), b: Point(1, 3)),
        Pair(colorId: 1, a: Point(0, 7), b: Point(6, 7)),
        Pair(colorId: 2, a: Point(5, 1), b: Point(2, 4)),
        Pair(colorId: 3, a: Point(2, 1), b: Point(6, 0)),
        Pair(colorId: 4, a: Point(1, 4), b: Point(0, 0)),
      ],
      solution: {
        5: [Point(1, 1), Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), Point(5, 2), Point(5, 3), Point(5, 4), ],
        0: [Point(5, 5), Point(4, 5), Point(3, 5), Point(3, 4), Point(3, 3), Point(2, 3), Point(1, 3), ],
        1: [Point(0, 7), Point(1, 7), Point(2, 7), Point(3, 7), Point(4, 7), Point(5, 7), Point(6, 7), ],
        2: [Point(5, 1), Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(2, 6), Point(2, 5), Point(2, 4), ],
        3: [Point(2, 1), Point(2, 0), Point(3, 0), Point(3, 1), Point(4, 1), Point(4, 0), Point(5, 0), Point(6, 0), ],
        4: [Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 5, a: Point(3, 6), b: Point(5, 1)),
        Pair(colorId: 1, a: Point(7, 3), b: Point(3, 5)),
        Pair(colorId: 3, a: Point(4, 4), b: Point(1, 1)),
        Pair(colorId: 4, a: Point(7, 2), b: Point(3, 0)),
        Pair(colorId: 0, a: Point(0, 3), b: Point(2, 0)),
        Pair(colorId: 2, a: Point(2, 4), b: Point(0, 7)),
      ],
      solution: {
        5: [Point(3, 6), Point(4, 6), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), ],
        1: [Point(7, 3), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(2, 6), Point(2, 5), Point(3, 5), ],
        3: [Point(4, 4), Point(3, 4), Point(3, 3), Point(2, 3), Point(1, 3), Point(1, 2), Point(1, 1), ],
        4: [Point(7, 2), Point(6, 2), Point(6, 1), Point(6, 0), Point(5, 0), Point(4, 0), Point(3, 0), ],
        0: [Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), Point(2, 0), ],
        2: [Point(2, 4), Point(1, 4), Point(1, 5), Point(0, 5), Point(0, 6), Point(1, 6), Point(1, 7), Point(0, 7), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(2, 5), b: Point(4, 0)),
        Pair(colorId: 3, a: Point(4, 1), b: Point(6, 6)),
        Pair(colorId: 5, a: Point(7, 6), b: Point(6, 0)),
        Pair(colorId: 0, a: Point(1, 1), b: Point(3, 5)),
        Pair(colorId: 4, a: Point(2, 7), b: Point(0, 3)),
        Pair(colorId: 2, a: Point(4, 2), b: Point(4, 7)),
      ],
      solution: {
        1: [Point(2, 5), Point(2, 4), Point(3, 4), Point(3, 3), Point(3, 2), Point(3, 1), Point(3, 0), Point(4, 0), ],
        3: [Point(4, 1), Point(5, 1), Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), ],
        5: [Point(7, 6), Point(7, 5), Point(7, 4), Point(7, 3), Point(7, 2), Point(7, 1), Point(7, 0), Point(6, 0), ],
        0: [Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(1, 5), Point(1, 6), Point(2, 6), Point(3, 6), Point(3, 5), ],
        4: [Point(2, 7), Point(1, 7), Point(0, 7), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), ],
        2: [Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), Point(4, 6), Point(4, 7), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(5, 4), b: Point(0, 0)),
        Pair(colorId: 2, a: Point(2, 3), b: Point(6, 6)),
        Pair(colorId: 4, a: Point(4, 2), b: Point(6, 7)),
        Pair(colorId: 0, a: Point(7, 0), b: Point(2, 1)),
        Pair(colorId: 3, a: Point(0, 4), b: Point(2, 7)),
        Pair(colorId: 5, a: Point(2, 2), b: Point(5, 0)),
      ],
      solution: {
        1: [Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 3), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        2: [Point(2, 3), Point(3, 3), Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 4), Point(6, 5), Point(6, 6), ],
        4: [Point(4, 2), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(7, 6), Point(7, 7), Point(6, 7), ],
        0: [Point(7, 0), Point(6, 0), Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), ],
        3: [Point(0, 4), Point(0, 5), Point(1, 5), Point(2, 5), Point(2, 6), Point(2, 7), ],
        5: [Point(2, 2), Point(1, 2), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 5, a: Point(5, 7), b: Point(0, 1)),
        Pair(colorId: 4, a: Point(1, 0), b: Point(5, 5)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(4, 6)),
        Pair(colorId: 0, a: Point(6, 4), b: Point(7, 0)),
        Pair(colorId: 2, a: Point(6, 5), b: Point(7, 1)),
        Pair(colorId: 3, a: Point(2, 4), b: Point(4, 1)),
      ],
      solution: {
        5: [Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), Point(0, 7), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), ],
        4: [Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), ],
        1: [Point(2, 2), Point(3, 2), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), Point(4, 6), ],
        0: [Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), Point(7, 0), ],
        2: [Point(6, 5), Point(7, 5), Point(7, 4), Point(7, 3), Point(7, 2), Point(7, 1), ],
        3: [Point(2, 4), Point(1, 4), Point(1, 3), Point(1, 2), Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(7, 0), b: Point(1, 1)),
        Pair(colorId: 1, a: Point(4, 7), b: Point(1, 3)),
        Pair(colorId: 2, a: Point(2, 7), b: Point(7, 5)),
        Pair(colorId: 3, a: Point(2, 3), b: Point(6, 5)),
        Pair(colorId: 4, a: Point(2, 4), b: Point(5, 7)),
        Pair(colorId: 5, a: Point(5, 0), b: Point(0, 0)),
      ],
      solution: {
        0: [Point(7, 0), Point(6, 0), Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), Point(1, 1), ],
        1: [Point(4, 7), Point(3, 7), Point(3, 6), Point(2, 6), Point(1, 6), Point(1, 5), Point(1, 4), Point(1, 3), ],
        2: [Point(2, 7), Point(1, 7), Point(0, 7), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), ],
        3: [Point(2, 3), Point(3, 3), Point(4, 3), Point(5, 3), Point(6, 3), Point(6, 4), Point(6, 5), ],
        4: [Point(2, 4), Point(3, 4), Point(4, 4), Point(5, 4), Point(5, 5), Point(5, 6), Point(5, 7), ],
        5: [Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(5, 6), b: Point(2, 1)),
        Pair(colorId: 2, a: Point(0, 7), b: Point(0, 0)),
        Pair(colorId: 1, a: Point(3, 6), b: Point(1, 2)),
        Pair(colorId: 3, a: Point(3, 4), b: Point(6, 2)),
        Pair(colorId: 4, a: Point(5, 3), b: Point(4, 7)),
        Pair(colorId: 5, a: Point(3, 3), b: Point(5, 0)),
      ],
      solution: {
        0: [Point(5, 6), Point(4, 6), Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), ],
        2: [Point(0, 7), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), ],
        1: [Point(3, 6), Point(3, 7), Point(2, 7), Point(2, 6), Point(1, 6), Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), ],
        3: [Point(3, 4), Point(4, 4), Point(5, 4), Point(6, 4), Point(6, 3), Point(6, 2), ],
        4: [Point(5, 3), Point(5, 2), Point(5, 1), Point(6, 1), Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(6, 5), Point(6, 6), Point(6, 7), Point(5, 7), Point(4, 7), ],
        5: [Point(3, 3), Point(4, 3), Point(4, 2), Point(4, 1), Point(4, 0), Point(5, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(3, 0), b: Point(6, 3)),
        Pair(colorId: 1, a: Point(0, 6), b: Point(3, 3)),
        Pair(colorId: 2, a: Point(2, 0), b: Point(2, 6)),
        Pair(colorId: 3, a: Point(7, 1), b: Point(6, 6)),
        Pair(colorId: 4, a: Point(7, 6), b: Point(5, 2)),
        Pair(colorId: 5, a: Point(0, 5), b: Point(3, 2)),
      ],
      solution: {
        0: [Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(6, 1), Point(6, 2), Point(6, 3), ],
        1: [Point(0, 6), Point(1, 6), Point(1, 5), Point(2, 5), Point(3, 5), Point(3, 4), Point(3, 3), ],
        2: [Point(2, 0), Point(2, 1), Point(3, 1), Point(4, 1), Point(4, 2), Point(4, 3), Point(4, 4), Point(4, 5), Point(4, 6), Point(3, 6), Point(2, 6), ],
        3: [Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), Point(6, 4), Point(6, 5), Point(6, 6), ],
        4: [Point(7, 6), Point(7, 7), Point(6, 7), Point(5, 7), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), ],
        5: [Point(0, 5), Point(0, 4), Point(1, 4), Point(2, 4), Point(2, 3), Point(1, 3), Point(0, 3), Point(0, 2), Point(1, 2), Point(2, 2), Point(3, 2), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(7, 1), b: Point(3, 3)),
        Pair(colorId: 2, a: Point(1, 6), b: Point(6, 7)),
        Pair(colorId: 5, a: Point(1, 1), b: Point(5, 3)),
        Pair(colorId: 1, a: Point(5, 6), b: Point(7, 3)),
        Pair(colorId: 3, a: Point(2, 3), b: Point(4, 0)),
        Pair(colorId: 4, a: Point(4, 2), b: Point(1, 0)),
      ],
      solution: {
        0: [Point(7, 1), Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(3, 2), Point(3, 3), ],
        2: [Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(4, 7), Point(5, 7), Point(6, 7), ],
        5: [Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), Point(5, 4), Point(5, 3), ],
        1: [Point(5, 6), Point(6, 6), Point(7, 6), Point(7, 5), Point(7, 4), Point(7, 3), ],
        3: [Point(2, 3), Point(2, 2), Point(2, 1), Point(2, 0), Point(3, 0), Point(4, 0), ],
        4: [Point(4, 2), Point(5, 2), Point(6, 2), Point(6, 3), Point(6, 4), Point(6, 5), Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), Point(0, 0), Point(1, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(3, 3), b: Point(0, 6)),
        Pair(colorId: 5, a: Point(1, 3), b: Point(6, 4)),
        Pair(colorId: 0, a: Point(5, 0), b: Point(0, 0)),
        Pair(colorId: 1, a: Point(3, 6), b: Point(5, 3)),
        Pair(colorId: 2, a: Point(1, 1), b: Point(0, 5)),
        Pair(colorId: 3, a: Point(7, 7), b: Point(4, 5)),
      ],
      solution: {
        4: [Point(3, 3), Point(2, 3), Point(2, 4), Point(1, 4), Point(1, 5), Point(1, 6), Point(0, 6), ],
        5: [Point(1, 3), Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), Point(5, 2), Point(6, 2), Point(6, 3), Point(6, 4), ],
        0: [Point(5, 0), Point(4, 0), Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), ],
        1: [Point(3, 6), Point(4, 6), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), ],
        2: [Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        3: [Point(7, 7), Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(2, 6), Point(2, 5), Point(3, 5), Point(4, 5), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 5), b: Point(7, 3)),
        Pair(colorId: 0, a: Point(0, 3), b: Point(5, 2)),
        Pair(colorId: 1, a: Point(2, 2), b: Point(5, 0)),
        Pair(colorId: 3, a: Point(6, 4), b: Point(7, 0)),
        Pair(colorId: 4, a: Point(3, 7), b: Point(4, 3)),
        Pair(colorId: 5, a: Point(6, 0), b: Point(2, 1)),
      ],
      solution: {
        2: [Point(2, 5), Point(3, 5), Point(4, 5), Point(5, 5), Point(6, 5), Point(7, 5), Point(7, 4), Point(7, 3), ],
        0: [Point(0, 3), Point(1, 3), Point(2, 3), Point(3, 3), Point(3, 2), Point(4, 2), Point(5, 2), ],
        1: [Point(2, 2), Point(1, 2), Point(1, 1), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), ],
        3: [Point(6, 4), Point(6, 3), Point(6, 2), Point(7, 2), Point(7, 1), Point(7, 0), ],
        4: [Point(3, 7), Point(2, 7), Point(1, 7), Point(1, 6), Point(1, 5), Point(1, 4), Point(2, 4), Point(3, 4), Point(4, 4), Point(4, 3), ],
        5: [Point(6, 0), Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(2, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(1, 6), b: Point(7, 7)),
        Pair(colorId: 2, a: Point(4, 5), b: Point(7, 2)),
        Pair(colorId: 5, a: Point(4, 2), b: Point(3, 7)),
        Pair(colorId: 0, a: Point(1, 1), b: Point(5, 0)),
        Pair(colorId: 1, a: Point(2, 4), b: Point(5, 2)),
        Pair(colorId: 3, a: Point(2, 5), b: Point(5, 3)),
      ],
      solution: {
        4: [Point(1, 6), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(7, 6), Point(7, 7), ],
        2: [Point(4, 5), Point(5, 5), Point(6, 5), Point(7, 5), Point(7, 4), Point(7, 3), Point(7, 2), ],
        5: [Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(0, 7), Point(1, 7), Point(2, 7), Point(3, 7), ],
        0: [Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(5, 0), ],
        1: [Point(2, 4), Point(3, 4), Point(4, 4), Point(5, 4), Point(6, 4), Point(6, 3), Point(6, 2), Point(5, 2), ],
        3: [Point(2, 5), Point(1, 5), Point(1, 4), Point(1, 3), Point(2, 3), Point(3, 3), Point(4, 3), Point(5, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(5, 6), b: Point(0, 1)),
        Pair(colorId: 1, a: Point(3, 6), b: Point(0, 3)),
        Pair(colorId: 2, a: Point(1, 7), b: Point(5, 5)),
        Pair(colorId: 5, a: Point(3, 0), b: Point(5, 4)),
        Pair(colorId: 0, a: Point(7, 5), b: Point(6, 1)),
        Pair(colorId: 3, a: Point(3, 2), b: Point(0, 0)),
      ],
      solution: {
        4: [Point(5, 6), Point(4, 6), Point(4, 5), Point(3, 5), Point(3, 4), Point(4, 4), Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 1), ],
        1: [Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), ],
        2: [Point(1, 7), Point(2, 7), Point(3, 7), Point(4, 7), Point(5, 7), Point(6, 7), Point(6, 6), Point(6, 5), Point(5, 5), ],
        5: [Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), Point(5, 2), Point(5, 3), Point(5, 4), ],
        0: [Point(7, 5), Point(7, 4), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), ],
        3: [Point(3, 2), Point(3, 1), Point(2, 1), Point(1, 1), Point(1, 0), Point(0, 0), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 3, a: Point(3, 0), b: Point(0, 5)),
        Pair(colorId: 5, a: Point(2, 5), b: Point(7, 7)),
        Pair(colorId: 0, a: Point(2, 3), b: Point(4, 7)),
        Pair(colorId: 1, a: Point(1, 3), b: Point(7, 3)),
        Pair(colorId: 2, a: Point(2, 1), b: Point(7, 1)),
        Pair(colorId: 4, a: Point(3, 5), b: Point(6, 3)),
      ],
      solution: {
        3: [Point(3, 0), Point(2, 0), Point(1, 0), Point(0, 0), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), ],
        5: [Point(2, 5), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(7, 6), Point(7, 7), ],
        0: [Point(2, 3), Point(2, 4), Point(1, 4), Point(1, 5), Point(1, 6), Point(1, 7), Point(2, 7), Point(3, 7), Point(4, 7), ],
        1: [Point(1, 3), Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 3), ],
        2: [Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(6, 1), Point(7, 1), ],
        4: [Point(3, 5), Point(4, 5), Point(5, 5), Point(6, 5), Point(6, 4), Point(6, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(6, 1), b: Point(1, 3)),
        Pair(colorId: 2, a: Point(1, 6), b: Point(6, 7)),
        Pair(colorId: 4, a: Point(2, 5), b: Point(6, 3)),
        Pair(colorId: 5, a: Point(0, 0), b: Point(5, 1)),
        Pair(colorId: 0, a: Point(3, 6), b: Point(7, 5)),
        Pair(colorId: 3, a: Point(2, 4), b: Point(0, 1)),
      ],
      solution: {
        1: [Point(6, 1), Point(6, 2), Point(5, 2), Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(1, 3), ],
        2: [Point(1, 6), Point(2, 6), Point(2, 7), Point(3, 7), Point(4, 7), Point(5, 7), Point(6, 7), ],
        4: [Point(2, 5), Point(3, 5), Point(4, 5), Point(5, 5), Point(6, 5), Point(6, 4), Point(6, 3), ],
        5: [Point(0, 0), Point(1, 0), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), ],
        0: [Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(7, 6), Point(7, 5), ],
        3: [Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 3), Point(0, 2), Point(0, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(7, 0), b: Point(3, 5)),
        Pair(colorId: 3, a: Point(2, 5), b: Point(7, 4)),
        Pair(colorId: 0, a: Point(1, 3), b: Point(0, 7)),
        Pair(colorId: 1, a: Point(6, 6), b: Point(2, 7)),
        Pair(colorId: 2, a: Point(1, 1), b: Point(5, 0)),
        Pair(colorId: 5, a: Point(2, 3), b: Point(0, 6)),
      ],
      solution: {
        4: [Point(7, 0), Point(6, 0), Point(6, 1), Point(5, 1), Point(4, 1), Point(3, 1), Point(3, 2), Point(3, 3), Point(3, 4), Point(3, 5), ],
        3: [Point(2, 5), Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(5, 5), Point(6, 5), Point(7, 5), Point(7, 4), ],
        0: [Point(1, 3), Point(1, 4), Point(1, 5), Point(1, 6), Point(1, 7), Point(0, 7), ],
        1: [Point(6, 6), Point(7, 6), Point(7, 7), Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), ],
        2: [Point(1, 1), Point(2, 1), Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), ],
        5: [Point(2, 3), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 4, a: Point(1, 2), b: Point(5, 5)),
        Pair(colorId: 0, a: Point(3, 4), b: Point(0, 7)),
        Pair(colorId: 1, a: Point(5, 6), b: Point(6, 1)),
        Pair(colorId: 2, a: Point(1, 5), b: Point(4, 7)),
        Pair(colorId: 3, a: Point(2, 0), b: Point(7, 0)),
        Pair(colorId: 5, a: Point(4, 4), b: Point(0, 3)),
      ],
      solution: {
        4: [Point(1, 2), Point(2, 2), Point(3, 2), Point(4, 2), Point(5, 2), Point(5, 3), Point(5, 4), Point(5, 5), ],
        0: [Point(3, 4), Point(2, 4), Point(1, 4), Point(0, 4), Point(0, 5), Point(0, 6), Point(0, 7), ],
        1: [Point(5, 6), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), ],
        2: [Point(1, 5), Point(2, 5), Point(3, 5), Point(4, 5), Point(4, 6), Point(4, 7), ],
        3: [Point(2, 0), Point(3, 0), Point(4, 0), Point(5, 0), Point(6, 0), Point(7, 0), ],
        5: [Point(4, 4), Point(4, 3), Point(3, 3), Point(2, 3), Point(1, 3), Point(0, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(1, 1), b: Point(7, 0)),
        Pair(colorId: 0, a: Point(3, 6), b: Point(0, 3)),
        Pair(colorId: 1, a: Point(5, 5), b: Point(1, 7)),
        Pair(colorId: 4, a: Point(4, 2), b: Point(0, 0)),
        Pair(colorId: 3, a: Point(5, 2), b: Point(2, 4)),
        Pair(colorId: 5, a: Point(4, 5), b: Point(1, 3)),
      ],
      solution: {
        2: [Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(5, 1), Point(6, 1), Point(7, 1), Point(7, 0), ],
        0: [Point(3, 6), Point(2, 6), Point(1, 6), Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), ],
        1: [Point(5, 5), Point(5, 6), Point(4, 6), Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), ],
        4: [Point(4, 2), Point(3, 2), Point(2, 2), Point(1, 2), Point(0, 2), Point(0, 1), Point(0, 0), ],
        3: [Point(5, 2), Point(5, 3), Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 4), ],
        5: [Point(4, 5), Point(3, 5), Point(2, 5), Point(1, 5), Point(1, 4), Point(1, 3), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 1, a: Point(3, 6), b: Point(5, 2)),
        Pair(colorId: 3, a: Point(3, 2), b: Point(7, 0)),
        Pair(colorId: 5, a: Point(4, 6), b: Point(4, 0)),
        Pair(colorId: 0, a: Point(1, 5), b: Point(0, 1)),
        Pair(colorId: 2, a: Point(6, 5), b: Point(7, 1)),
        Pair(colorId: 4, a: Point(0, 3), b: Point(1, 7)),
      ],
      solution: {
        1: [Point(3, 6), Point(3, 5), Point(4, 5), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), ],
        3: [Point(3, 2), Point(4, 2), Point(4, 1), Point(5, 1), Point(6, 1), Point(6, 0), Point(7, 0), ],
        5: [Point(4, 6), Point(4, 7), Point(3, 7), Point(2, 7), Point(2, 6), Point(2, 5), Point(2, 4), Point(2, 3), Point(2, 2), Point(2, 1), Point(3, 1), Point(3, 0), Point(4, 0), ],
        0: [Point(1, 5), Point(1, 4), Point(1, 3), Point(1, 2), Point(0, 2), Point(0, 1), ],
        2: [Point(6, 5), Point(7, 5), Point(7, 4), Point(7, 3), Point(7, 2), Point(7, 1), ],
        4: [Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(1, 7), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 4), b: Point(6, 0)),
        Pair(colorId: 5, a: Point(2, 3), b: Point(7, 6)),
        Pair(colorId: 4, a: Point(7, 1), b: Point(4, 5)),
        Pair(colorId: 0, a: Point(3, 0), b: Point(5, 3)),
        Pair(colorId: 1, a: Point(5, 7), b: Point(1, 6)),
        Pair(colorId: 3, a: Point(0, 6), b: Point(1, 2)),
      ],
      solution: {
        2: [Point(2, 4), Point(3, 4), Point(4, 4), Point(5, 4), Point(6, 4), Point(6, 3), Point(6, 2), Point(6, 1), Point(6, 0), ],
        5: [Point(2, 3), Point(1, 3), Point(1, 4), Point(1, 5), Point(2, 5), Point(3, 5), Point(3, 6), Point(4, 6), Point(5, 6), Point(6, 6), Point(7, 6), ],
        4: [Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(6, 5), Point(5, 5), Point(4, 5), ],
        0: [Point(3, 0), Point(4, 0), Point(5, 0), Point(5, 1), Point(4, 1), Point(3, 1), Point(3, 2), Point(3, 3), Point(4, 3), Point(4, 2), Point(5, 2), Point(5, 3), ],
        1: [Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(2, 6), Point(1, 6), ],
        3: [Point(0, 6), Point(0, 5), Point(0, 4), Point(0, 3), Point(0, 2), Point(1, 2), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 0, a: Point(2, 1), b: Point(1, 7)),
        Pair(colorId: 2, a: Point(6, 4), b: Point(1, 6)),
        Pair(colorId: 5, a: Point(6, 3), b: Point(3, 7)),
        Pair(colorId: 1, a: Point(3, 3), b: Point(7, 1)),
        Pair(colorId: 3, a: Point(5, 5), b: Point(2, 7)),
        Pair(colorId: 4, a: Point(1, 3), b: Point(4, 1)),
      ],
      solution: {
        0: [Point(2, 1), Point(1, 1), Point(0, 1), Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(0, 7), Point(1, 7), ],
        2: [Point(6, 4), Point(5, 4), Point(4, 4), Point(3, 4), Point(2, 4), Point(1, 4), Point(1, 5), Point(1, 6), ],
        5: [Point(6, 3), Point(7, 3), Point(7, 4), Point(7, 5), Point(6, 5), Point(6, 6), Point(5, 6), Point(4, 6), Point(3, 6), Point(3, 7), ],
        1: [Point(3, 3), Point(4, 3), Point(5, 3), Point(5, 2), Point(6, 2), Point(7, 2), Point(7, 1), ],
        3: [Point(5, 5), Point(4, 5), Point(3, 5), Point(2, 5), Point(2, 6), Point(2, 7), ],
        4: [Point(1, 3), Point(2, 3), Point(2, 2), Point(3, 2), Point(4, 2), Point(4, 1), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(6, 7), b: Point(1, 6)),
        Pair(colorId: 3, a: Point(6, 1), b: Point(5, 6)),
        Pair(colorId: 0, a: Point(5, 2), b: Point(7, 5)),
        Pair(colorId: 1, a: Point(0, 1), b: Point(4, 2)),
        Pair(colorId: 4, a: Point(5, 3), b: Point(2, 5)),
        Pair(colorId: 5, a: Point(0, 7), b: Point(0, 2)),
      ],
      solution: {
        2: [Point(6, 7), Point(5, 7), Point(4, 7), Point(3, 7), Point(2, 7), Point(1, 7), Point(1, 6), ],
        3: [Point(6, 1), Point(6, 2), Point(6, 3), Point(6, 4), Point(5, 4), Point(5, 5), Point(5, 6), ],
        0: [Point(5, 2), Point(5, 1), Point(5, 0), Point(6, 0), Point(7, 0), Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), ],
        1: [Point(0, 1), Point(1, 1), Point(2, 1), Point(3, 1), Point(4, 1), Point(4, 2), ],
        4: [Point(5, 3), Point(4, 3), Point(3, 3), Point(2, 3), Point(2, 4), Point(2, 5), ],
        5: [Point(0, 7), Point(0, 6), Point(0, 5), Point(1, 5), Point(1, 4), Point(0, 4), Point(0, 3), Point(1, 3), Point(1, 2), Point(0, 2), ],
      },
    ),
    Level(
      size: 8,
      requireFullFill: false,
      blocked: <Point<int>>{
      },
      pairs: [
        Pair(colorId: 2, a: Point(2, 6), b: Point(5, 1)),
        Pair(colorId: 3, a: Point(0, 2), b: Point(6, 2)),
        Pair(colorId: 5, a: Point(7, 0), b: Point(7, 6)),
        Pair(colorId: 0, a: Point(1, 5), b: Point(4, 3)),
        Pair(colorId: 1, a: Point(1, 0), b: Point(2, 4)),
        Pair(colorId: 4, a: Point(4, 0), b: Point(2, 3)),
      ],
      solution: {
        2: [Point(2, 6), Point(3, 6), Point(4, 6), Point(5, 6), Point(5, 5), Point(5, 4), Point(5, 3), Point(5, 2), Point(5, 1), ],
        3: [Point(0, 2), Point(0, 3), Point(0, 4), Point(0, 5), Point(0, 6), Point(1, 6), Point(1, 7), Point(2, 7), Point(3, 7), Point(4, 7), Point(5, 7), Point(6, 7), Point(6, 6), Point(6, 5), Point(6, 4), Point(6, 3), Point(6, 2), ],
        5: [Point(7, 0), Point(7, 1), Point(7, 2), Point(7, 3), Point(7, 4), Point(7, 5), Point(7, 6), ],
        0: [Point(1, 5), Point(2, 5), Point(3, 5), Point(4, 5), Point(4, 4), Point(4, 3), ],
        1: [Point(1, 0), Point(1, 1), Point(1, 2), Point(1, 3), Point(1, 4), Point(2, 4), ],
        4: [Point(4, 0), Point(3, 0), Point(2, 0), Point(2, 1), Point(2, 2), Point(2, 3), ],
      },
    ),
  ];
}
