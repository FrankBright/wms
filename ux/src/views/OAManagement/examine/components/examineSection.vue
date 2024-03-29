<template>
  <div>
    <examine-cell v-for="(item, index) in list"
                  :key="index"
                  :data="item"
                  @on-handle="examineCellHandle"></examine-cell>
    <slot name="load"></slot>
    <examine-detail v-if="showDview"
                    :id="rowID"
                    class="d-view"
                    @on-examine-handle="handleResult('examine-detail')"
                    @hide-view="showDview=false">
    </examine-detail>
    <c-r-m-all-detail :visible.sync="showRelatedDetail"
                      :crmType="relatedCRMType"
                      :listenerIDs="['workbench-main-container']"
                      :noListenerIDs="['examine-list-box']"
                      :id="relatedID"></c-r-m-all-detail>
    <examine-handle :show="showExamineHandle"
                    @close="showExamineHandle = false"
                    @save="handleResult('examine-handle')"
                    :id="rowID"
                    :recordId="rowData.examineRecordId"
                    :detail="rowData"
                    examineType="oa_examine"
                    status="4"></examine-handle>
    <examine-create-view v-if="isCreate"
                         :categoryId="createInfo.categoryId"
                         :type="createInfo.type"
                         :categoryTitle="createInfo.title"
                         :action="createAction"
                         @save-success="handleResult('edit')"
                         @hiden-view="isCreate = false"></examine-create-view>
  </div>
</template>

<script>
import ExamineCell from './examineCell'
import ExamineDetail from './examineDetail'
import CRMAllDetail from '@/views/customermanagement/components/CRMAllDetail'
import ExamineHandle from '@/components/Examine/ExamineHandle' // 审批操作理由
import ExamineCreateView from './examineCreateView'

export default {
  components: {
    ExamineCell,
    ExamineDetail,
    CRMAllDetail,
    ExamineHandle,
    ExamineCreateView
  },

  data() {
    return {
      // 控制详情展示
      rowID: '',
      rowData: {}, // 行全部信息
      showDview: false,

      // 相关详情的查看
      relatedID: '',
      relatedCRMType: '',
      showRelatedDetail: false,

      // 撤回操作
      showExamineHandle: false,

      //编辑操作
      isCreate: false, //是编辑
      createAction: { type: 'update' },
      createInfo: {} // 编辑所需要的id 标题名信息
    }
  },

  watch: {
    list() {
      this.showRelatedDetail = false
      this.showDview = false
    }
  },

  props: {
    list: Array
  },

  mounted() {},

  methods: {
    /**
     * 操作
     */
    examineCellHandle(data) {
      // 编辑
      if (data.type == 'edit') {
        let item = data.data.item
        item.title = item.categoryName
        this.createInfo = item
        this.createAction = { type: 'update', id: item.examineId, data: item }
        this.isCreate = true
        // 删除
      } else if (data.type == 'delete') {
        this.$confirm('确定删除?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })
          .then(() => {
            oaExamineDelete({
              examineId: data.data.item.examineId
            }).then(res => {
              this.searchBtn()
              this.$message({
                type: 'success',
                message: '删除成功!'
              })
            })
          })
          .catch(() => {
            this.$message({
              type: 'info',
              message: '已取消删除'
            })
          })
        // 撤回
      } else if (data.type == 'withdraw') {
        this.rowID = data.data.item.examineId
        this.rowData = data.data.item
        this.showExamineHandle = true
        // 详情
      } else if (data.type == 'view') {
        this.showRelatedDetail = false
        this.rowID = data.data.item.examineId
        this.showDview = true
      } else if (data.type == 'related-detail') {
        this.showDview = false
        this.relatedID = data.data.item[data.data.type + 'Id']
        this.relatedCRMType = data.data.type
        this.showRelatedDetail = true
      }
    },

    /**
     * 审批操作
     */
    handleResult(type) {
      this.$emit('handle', type)
    }
  }
}
</script>

<style scoped lang="scss">
.d-view {
  position: fixed;
  width: 950px;
  top: 60px;
  bottom: 0px;
  right: 0px;
}
</style>
