<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class PingController extends Controller
{
    /**
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        DB::selectOne('SELECT 1');

        return response()->json('Pong');
    }
}
