<div class="table-responsive">
    <table id="advance-1" class="table table-striped table-theme" style="width:100%;">
        <thead>
            <tr>
                <th class="checkboxlist text-center" style="width:5%"><input class="tp-check-all checkAll" type="checkbox">
                </th>
                <th class="text-left" style="width:21%">{{ __('Product Name') }}</th>
                <th class="text-left" style="width:15%">{{ __('Category') }}</th>
                {{-- <th class="text-left" style="width:15%">{{ __('Brand') }}</th> --}}
                <th class="text-center" style="width:10%">{{ __('Store') }}</th>

                <th class="text-center" style="width:8%">{{ __('Image') }} </th>
                <th class="text-center" style="width:8%">{{ __('Status') }}</th>
                <th class="text-center" style="width:8%">{{ __('Action') }}</th>
            </tr>
        </thead>
        <tbody>

            @foreach ($datalist as $row)
                @php
                    if (!empty($row->brand_id)) {
                        $brandName = \App\Models\Brand::where('id', $row->brand_id)->first()->name;
                    }
                    if (!empty($storeName)) {
                        $storeName = \App\Models\User::where('id', $row->store_id)->first()->store;
                    }

                @endphp
                <tr>
                    <td class="checkboxlist text-center"><input name="item_ids[]" value="{{ $row->id }}"
                            class="tp-checkbox selected_item" type="checkbox"></td>

                    <td class="text-left"><a href="{{ route('backend.product', [$row->id]) }}"
                            title="{{ __('Edit') }}">{{ $row->title }}</a></td>
                    <td class="text-left">{{ $row->cat_id }}</td>


                    <td class="text-center">
                        @if (!empty($storeName))
                            {{ $storeName }}
                        @endif
                    </td>

                    @if ($row->f_thumbnail != '')
                        <td class="text-center">
                            <div class="table_col_image"><img
                                    src="{{ asset('') }}f_thumbnail/{{ $row->f_thumbnail }}" width="100"
                                    height="60" /></div>
                        </td>
                    @else
                        <td class="text-center">
                            <div class="table_col_image"><img
                                    src="{{ asset('') }}/backend/images/album_icon.png" /></div>
                        </td>
                    @endif

                    @if ($row->is_publish == 1)
                        <td class="text-center"><span class="enable_btn">{{ $row->status }}</span></td>
                    @else
                        <td class="text-center"><span class="disable_btn">{{ $row->status }}</span></td>
                    @endif
                    <td class="text-center">
                        <div class="btn-group action-group">
                            <a class="action-btn" href="javascript:void(0);" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item"
                                    href="{{ route('backend.product', [$row->id]) }}">{{ __('Edit') }}</a>
                                <a onclick="onDelete({{ $row->id }})" class="dropdown-item"
                                    href="javascript:void(0);">{{ __('Delete') }}</a>
                            </div>
                        </div>
                    </td>
                </tr>
            @endforeach

        </tbody>
    </table>
</div>
