<?php

namespace App\Traits;

trait General
{
    private function controlRedirection($request, $route, $model)
    {
        switch ($request->input('action')) {
            case 'save_and_add':
                $this->showToastrMessage('success', trans('message.created', ['title' => $model]));
                return redirect()->back();
                break;

            case 'save':
                $this->showToastrMessage('success', trans('message.created', ['title' => $model]));
                return redirect()->route($route.'.index');
                break;

            case 'update':
                $this->showToastrMessage('success', trans('message.updated', ['title' => $model]));
                return redirect()->route($route.'.index');
                break;

            default:
                $this->showToastrMessage('success', trans('message.created', ['title' => $model]));
                return redirect()->route($route.'.index');
        }
    }

    private function showToastrMessage($type, $message)
    {
        switch ($type) {
            case 'success':
                return toastr()->success($message, '', ["positionClass" => "toast-bottom-right"]);
                break;
            case 'warning':
                return toastr()->warning($message, '', ["positionClass" => "toast-bottom-right"]);
                break;
            case 'error':
                return toastr()->error($message, '', ["positionClass" => "toast-bottom-right"]);
                break;
            default:
                return toastr()->success($message, '', ["positionClass" => "toast-bottom-right"]);
        }
    }
}
